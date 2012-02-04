# Maintainer: Ben Webb <bjwebb67 at googlemail dot com>
pkgname="evergeen-ils"
true && pkgname=(evergreen-ils evergreen-ils-client)
pkgver=2.0.6
pkgrel=3
pkgdesc="A highly-scalable software for libraries."
arch=('i686' 'x86_64')
url="http://evergreen-ils.org/"
license=('GPL')
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
        perl-universal-moniker
)
install=($pkgname.install)
source=(http://evergreen-ils.org/downloads/Evergreen-ILS-$pkgver.tar.gz $pkgname.patch)
md5sums=('c12100e8707823efe175ad07f536c942' 'f6c688e79218057ed4f1d33c34694966')

build() {
    cd "$srcdir/Evergreen-ILS-$pkgver"
    patch -Np1 -r - -i ../$pkgname.patch
    ./autogen.sh
    ./configure --with-opensrf-headers=/opensrf/include/ \
    --with-opensrf-libs=/opensrf/lib/
    make
}

package_evergreen-ils() {
    cd "$srcdir/Evergreen-ILS-$pkgver"
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
}

package_evergreen-ils-client() {
    install=
    depends=(xulrunner-1.9)
    mkdir -p "${pkgdir}/openils/"
    cp -r "${srcdir}/Evergreen-ILS-$pkgver/Open-ILS/xul/staff_client/build" "${pkgdir}/openils/client"
}
