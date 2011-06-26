# Maintainer: Ben Webb <bjwebb67 at googlemail dot com>
pkgname=evergreen-ils-git
pkgver=20110626
pkgrel=1
pkgdesc="A highly-scalable software for libraries."
arch=('i686' 'x86_64')
url="http://evergreen-ils.org/"
license=('GPL')
conlicts=(evergreen-ils evergreen-ils-client)
provides=(evergreen-ils evergreen-ils-client)
depends=(opensrf \
        aspell \
        aspell-en \
        libdbi \
        libdbi-drivers \
        libssh2 \
        ncurses \
        perl-dbd-pg \
        perl-email-send \
        perl-text-csv
        postgresql \
        readline \
        tcp_wrappers \
        wget \
        yaz \
        perl-parent \
        perl-business-isbn \
        perl-business-isbn-data \
        perl-gdgraph-3d \
        perl-ole-storage-lite \
        perl-spreadsheet-writeexcel \
        perl-text-aspell \
        perl-text-csv-xs \
        perl-business-creditcard \
        perl-net-ssh2 \
        perl-library-callnumber-lc \
        perl-uuid-tiny \
        perl-json-xs \
        perl-marc-record \
        perl-marc-file-xml \
        perl-javascript-spidermonkey \
        perl-class-dbi-frozen-301 \
        perl-business-edi \
        perl-class-trigger \
        perl-net-z3950-zoom \
        perl-class-data-inheritable \
        perl-universal-moniker \
        xulrunner-1.9
)
install=(evergreen-ils.install)
source=()
md5sums=()

_gitroot='git://git.evergreen-ils.org/Evergreen.git'
_gitname='Evergreen'

build() {
    if [ -d $_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
    else
      git clone $_gitroot $_gitname --depth=1
      cd $_gitname
    fi
    ./autogen.sh
    ./configure --with-opensrf-headers=/opensrf/include/ \
    --with-opensrf-libs=/opensrf/lib/
    make
}

package(){
    cd $srcdir/$_gitname
    mkdir -p "$pkgdir/etc/httpd/conf/"
    mkdir -p "$pkgdir/openils/var/run" "$pkgdir/openils/var/lock" "$pkgdir/openils/var/log"
    chmod a+w "$pkgdir/openils/var/log"
    ln -s "/opensrf/conf" "$pkgdir/openils/conf"
    mkdir -p "$pkgdir/var/log"; ln -s "/var/log/httpd" "$pkgdir/var/log/apache2"
    cp -r Open-ILS/src/support-scripts "$pkgdir/openils"
    cp -r Open-ILS/src/extras "$pkgdir/openils"
    cp -r Open-ILS/src/sql "$pkgdir/openils"
    make STAFF_CLIENT_BUILD_ID=rel_2_0_6 DESTDIR=$pkgdir install
    install Open-ILS/examples/apache/eg.conf       ${pkgdir}/etc/httpd/conf/
    install Open-ILS/examples/apache/eg_vhost.conf ${pkgdir}/etc/httpd/
    install Open-ILS/examples/apache/startup.pl    ${pkgdir}/etc/httpd/
    
    mkdir -p $pkgdir/opensrf/lib/
    for f in `ls $pkgdir/openils/lib`
        do ln -s /openils/lib/$f $pkgdir/opensrf/lib/
    done
    
    cp -r "${srcdir}/$_gitname/Open-ILS/xul/staff_client/build" "${pkgdir}/openils/client"
}