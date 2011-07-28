# Maintainer: Ben Webb <bjwebb67 at googlemail dot com>
pkgname="evergreen-ils"
true && pkgname=(evergreen-ils evergreen-ils-client)
pkgver=2.0.7
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
        perl-marc-charset
)
install=($pkgname.install)
source=(http://evergreen-ils.org/downloads/Evergreen-ILS-$pkgver.tar.gz $pkgname.patch)
md5sums=('c766834d23a711404b62f4500c1b8e37' 'b48fd6f58c36d6d62807d14960c64e76')

build() {
    cd "$srcdir/Evergreen-ILS-$pkgver"
    patch -Np1 -r - -i ../$pkgname.patch
    ./autogen.sh
    ./configure --with-opensrf-headers=/opensrf/include/ \
    --with-opensrf-libs=/opensrf/lib/ --enable-python
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
    make STAFF_CLIENT_BUILD_ID=rel_2_0_7 DESTDIR=$pkgdir install
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
