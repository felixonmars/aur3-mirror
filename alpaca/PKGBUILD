# Maintainer: stylish-mushroom <stylish.mushroom@gmail.com>

pkgname=alpaca
pkgver=3.0.0
pkgrel=1
pkgdesc="A minimalist package manager (bash pacman/AUR frontend)"
arch=('any')
url="http://arch-alpaca.googlecode.com"
license=('GPL')
depends=(bash curl grep sudo pacman)
source=(http://arch-alpaca.googlecode.com/files/alpaca-3.0.0.tar.gz)
md5sums=('b82e506069ea448a6a19cef2f8d557a0')

package() {
cd $srcdir/$pkgname-$pkgver
make DESTDIR="$pkgdir/" install
}
