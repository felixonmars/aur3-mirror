# Maintainer: stylish-mushroom <stylish.mushroom@gmail.com>

pkgname=alpaca
pkgver=3.1.0
pkgrel=1
pkgdesc="A minimalist package manager (bash pacman/AUR frontend)"
arch=('any')
url="http://arch-alpaca.googlecode.com"
license=('GPL')
depends=(bash curl grep sudo pacman)
source=(http://arch-alpaca.googlecode.com/files/alpaca-3.1.0.tar.gz)
md5sums=('1d2580dde7490edfdf0b7ea843e73748')

package() {
cd $srcdir/$pkgname-$pkgver
make DESTDIR="$pkgdir/" install
}
