# Contributor: Martin Pacheco < mp19uy [at] gmail [dot] com >
# Thanks to Bartosz Iwaniec for dcp375cw package, from which this package is
# heavily inspired and also from Mickael Falck for dcpj4110dw
pkgname=dcpj140w
pkgver=1.1.3
pkgrel=1
pkgdesc="CUPS driver for Brother DCP-J140W printer"
arch=('i686' 'x86_64')
license=('custom:Brother Industries')
depends=('cups' 'foomatic-filters' 'a2ps')
makedepends=('rpmextract')
url="http://solutions.brother.com/linux/en_us/index.html"
source=(http://www.brother.com/pub/bsc/linux/dlf/${pkgname}lpr-${pkgver}-6.i386.rpm \
    http://www.brother.com/pub/bsc/linux/dlf/${pkgname}cupswrapper-${pkgver}-6.i386.rpm)
md5sums=('599a7667f2c805d5dbc2fa655832f17c'
         'fa2d50677492bfc83e27184f316061c3')
install=$pkgname.install
[ "$CARCH" = "x86_64" ] && depends=('cups' 'foomatic-filters' 'lib32-glibc' 'a2ps')
package() {
    echo $pkggdir
    cd "$pkgdir" || return 1
    for n in $srcdir/*.rpm; do
        rpmextract.sh "$n" || return 1
    done 
    sed -i 's|/etc/init.d|/etc/rc.d|' $pkgdir/opt/brother/Printers/${pkgname}/cupswrapper/cupswrapper${pkgname}
}
