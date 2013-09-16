# Contributor: ogghi < schmidt [at] linux [dot] com >
pkgname=dcp385c
pkgver=1.1.2
pkgrel=1
pkgdesc="CUPS driver for Brother DCP-385C printer"
arch=('i686' 'x86_64')
license=('custom:Brother Industries')
depends=('cups' 'foomatic-filters' 'a2ps')
makedepends=('rpmextract')
url="http://solutions.brother.com/linux/en_us/index.html"
source=(http://www.brother.com/pub/bsc/linux/dlf/${pkgname}lpr-${pkgver}-2.i386.rpm \
    http://www.brother.com/pub/bsc/linux/dlf/${pkgname}cupswrapper-${pkgver}-2.i386.rpm)
md5sums=('e227cdf1f37cf21ffcafe9d97a252b6f'
         'fef7da3b2c8897dd008f2c14a8ac4be3')
install=$pkgname.install
[ "$CARCH" = "x86_64" ] && depends=('cups' 'foomatic-filters' 'lib32-glibc' 'a2ps')
build() {
    cd $pkgdir || return 1
    for n in $startdir/src/*.rpm; do
        rpmextract.sh "$n" || return 1
    done
    sed -i 's|/etc/init.d|/etc/rc.d|' $pkgdir/usr/local/Brother/Printer/${pkgname}/cupswrapper/cupswrapper${pkgname}
}
