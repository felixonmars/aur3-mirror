# Contributor: Bartosz Iwaniec < hash87 [at] gmail [dot] com >
pkgname=dcp375cw
pkgver=1.1.3
pkgrel=2
pkgdesc="CUPS driver for Brother DCP-375CW printer"
arch=('i686' 'x86_64')
license=('custom:Brother Industries')
depends=('cups' 'foomatic-filters' 'a2ps')
makedepends=('rpmextract')
url="http://solutions.brother.com/linux/en_us/index.html"
source=(http://www.brother.com/pub/bsc/linux/dlf/${pkgname}lpr-${pkgver}-1.i386.rpm \
    http://www.brother.com/pub/bsc/linux/dlf/${pkgname}cupswrapper-${pkgver}-1.i386.rpm)
md5sums=('60cdd83336cea4e35dc2e425ce164c2a'
         '38761700b844373e833fdc0705a5e89c')
install=$pkgname.install
[ "$CARCH" = "x86_64" ] && depends=('cups' 'foomatic-filters' 'lib32-glibc' 'a2ps')
package() {
    cd "$pkgdir" || return 1
    for n in $srcdir/*.rpm; do
        rpmextract.sh "$n" || return 1
    done 
    sed -i 's|/etc/init.d|/etc/rc.d|' $pkgdir/opt/brother/Printers/${pkgname}/cupswrapper/cupswrapper${pkgname}
}
