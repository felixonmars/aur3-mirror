# Contributor: Tastalian < tastalian [at] scaron [dot] info >
pkgname=dcp387c
pkgver=1.1.2
pkgrel=1
pkgdesc="CUPS driver for Brother DCP-387C printer"
arch=('i686' 'x86_64')
license=('custom:Brother Industries')
depends=('cups' 'foomatic-filters' 'a2ps')
makedepends=('rpmextract')
url="http://solutions.brother.com/linux/en_us/index.html"
source=(http://www.brother.com/pub/bsc/linux/dlf/${pkgname}lpr-${pkgver}-2.i386.rpm \
    http://www.brother.com/pub/bsc/linux/dlf/${pkgname}cupswrapper-${pkgver}-2.i386.rpm)
md5sums=('b4766d29ecfaf726a4ca0b23ee5cb761'
         '98a955eb1d98b523bbd2fee862222845')
install=$pkgname.install
[ "$CARCH" = "x86_64" ] && depends=('cups' 'foomatic-filters' 'lib32-glibc' 'a2ps')
build() {
    cd "$startdir/pkg" || return 1
    for n in $startdir/src/*.rpm; do
        rpmextract.sh "$n" || return 1
    done 
    sed -i 's|/etc/init.d|/etc/rc.d|' $pkgdir/usr/local/Brother/Printer/${pkgname}/cupswrapper/cupswrapper${pkgname}
}
