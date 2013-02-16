# Maintainer: stylish-mushroom <stylish.mushroom@gmail.com>

pkgname=alpaca
pkgver=2.0.0
pkgrel=1
pkgdesc="A minimalist package manager (bash pacman wrapper)"
arch=('any')
url="http://arch-alpaca.googlecode.com"
license=('GPL')
depends=(sudo wget)
source=(http://arch-alpaca.googlecode.com/files/alpaca-2.0.0.tar.gz)
md5sums=('338971bd0aae66f011d2e2b7249304db')

package() {
cd $srcdir/$pkgname-$pkgver
make DESTDIR="$pkgdir/" install
}
