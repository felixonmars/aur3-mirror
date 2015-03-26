# Maintainer: DJ Lucas <dj_AT_linuxfromscratch_DOT_org>
# Contributor: Michael Hansen <zrax0111 gmail com>
# Contributor: ngoonee <ngoonee.talk@gmail.com>
# Contributor: Adam Russell <adamlr6+arch@gmail.com>
pkgname=openchange-server
_pkgname=openchange
_codename=NANOPROBE
_dlid=246
pkgver=2.2
pkgrel=7
pkgdesc="A portable, open source implementation of Microsoft Exchange server \
and Exchange protocols."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.openchange.org"
license=('GPL3')
depends=('boost' 'file' 'libical' 'python2' 'samba>=4.1.11' 'sqlite3' 'mysql-python')
makedepends=('ccache' 'docbook-xsl' 'libxslt')
optdepends=('mod_wsgi' 'python2-pylons' 'python2-lxml' 'python2-pycurl')
options=(!makeflags)
conflicts=('openchange')
replaces=('openchange')
provides=('openchange')
source=("http://tracker.openchange.org/attachments/download/${_dlid}/${_pkgname}-${pkgver}-${_codename}.tar.gz"
        "ocsmanager.service"
        "openchange-samba42-1.patch")
sha256sums=('f15eb26d16370e85f01649300dd6722c31f0750437a4b60acd604a79439cf688'
            '45bd19e2a5725a94692ae606086be6d57423375c9b1c0eb5322c6e09ef2b5fb3'
            '7b8dfa93176faac054f43fb86ca79683cf142353e7f7d020c9ae7ae1001df28e')
build() {
    sourcedir="${srcdir}/${_pkgname}-${pkgver}-${_codename}"
    cd "${sourcedir}"
    patch -Np1 -i ${srcdir}/openchange-samba42-1.patch

    PYTHON_CALLERS="$(find ${sourcedir} -name '*.py')
                    $(find ${sourecdir} -name 'configure.ac')
                    setup/openchange_newuser setup/openchange_provision
                    mapiproxy/services/web/rpcproxy/rpcproxy.wsgi"
    sed -i -e "s|/usr/bin/env python$|/usr/bin/env python2|" \
           -e "s|python-config|python2-config|" \
           -e "s|bin/python|bin/python2|" \
            ${PYTHON_CALLERS}

    # Fix linking of boost_thread in autoconf test
    sed -i -e "s|-lboost_thread\$BOOST_LIB_SUFFIX|-lboost_thread\$BOOST_LIB_SUFFIX -lboost_system\$BOOST_LIB_SUFFIX|" \
        configure.ac

    # Fix type error in openchang-provision
    sed 's@  self.server_id)@  (self.server_id,))@' \
        -i python/openchange/mailbox.py

    export PYTHON=/usr/bin/python2

    export PKG_CONFIG_PATH="/usr/samba/lib/pkgconfig:/usr/lib/pkgconfig"
    ./autogen.sh
    ./configure --prefix=/usr \
                --sbindir=/usr/bin \
                --enable-pyopenchange \
                --with-modulesdir=/usr/lib/samba/modules \
                --with-datadir=/usr/share/samba

    # Fix build on ARCH!=x86_64
    rm mapiproxy/libmapi{proxy,store}/backends/*.po
    rm mapiproxy/util/*.po

    make FLEX=/usr/bin/flex BISON=/usr/bin/bison || return 1
}

package() {
    sourcedir="${srcdir}/${_pkgname}-${pkgver}-${_codename}"
    _pyver=`python2 -c 'import sys; print(sys.version[:3])'`

    cd "${sourcedir}"
    make DESTDIR="${pkgdir}" install
    make DESTDIR="${pkgdir}" pyopenchange-install

    cd ${pkgdir}/usr/lib/
    ln -s libmapi.so libmapi.so.0
    ln -s libocpf.so libocpf.so.0

    # Install OCSManager
    cd "${sourcedir}"
    make srcdir="${sourcedir}" DESTDIR="${pkgdir}" ocsmanager-install
    install -vdm700 -o http -g http "${pkgdir}/var/cache/ntlmauthhandler"
    install -vDm644 "${srcdir}/ocsmanager.service" \
                    "${pkgdir}/usr/lib/systemd/system/ocsmanager.service"
    install -vDm644 "${sourcedir}/mapiproxy/services/ocsmanager/ocsmanager.ini" \
                    "${pkgdir}/etc/ocsmanager/ocsmanager.ini"
    install -vDm644 "${sourcedir}/mapiproxy/services/ocsmanager/ocsmanager-apache.conf" \
                    "${pkgdir}/etc/httpd/conf/extra/ocsmanager.conf"

    # Install RPC Proxy
    cd "${sourcedir}/mapiproxy/services/web/rpcproxy"
    install -vdm755 "${pkgdir}/usr/lib/openchange/web/rpcproxy"
    install -vm644  "${sourcedir}/mapiproxy/services/web/rpcproxy/rpcproxy.conf" \
                    "${pkgdir}/etc/httpd/conf/extra/rpcproxy.conf"
    python2.7 setup.py install \
              --root="${pkgdir}" \
              --install-lib=/usr/lib/openchange/web/rpcproxy \
              --install-scripts=/usr/lib/openchange/web/rpcproxy

    find "${pkgdir}/usr/lib/python${_pyver}/site-packages/" -name '*.py' | \
         xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
}
