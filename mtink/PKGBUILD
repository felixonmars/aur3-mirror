# Maintainer: mareex <marcus dot behrendt dot 86 at gmail dot com>

pkgname=mtink
pkgver=1.0.16
pkgrel=2
pkgdesc="Epson printers Status Monitor"
url="http://xwtools.automatix.de"
license="GPL"
depends=(python lesstif)
source=(http://xwtools.automatix.de/files/$pkgname-$pkgver.tar.gz)
arch=('any')
md5sums=('43e5862c9ed129b533507271c4b53dea')

build() {
    cd $startdir/src/$pkgname-$pkgver
    ./Configure -p /usr/bin
    make
}

package() {
    cd $startdir/src/$pkgname-$pkgver
    make prefix=$pkgdir/usr install
}
