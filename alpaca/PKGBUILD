# Maintainer: stylish-mushroom <stylish.mushroom@gmail.com>

pkgname=alpaca
pkgver=3.2.0
pkgrel=1
pkgdesc="A minimalist package manager (bash pacman/AUR frontend)"
arch=('any')
url="http://arch-alpaca.googlecode.com"
license=('GPL')
depends=(bash curl grep sudo pacman)
source=(http://arch-alpaca.googlecode.com/files/alpaca-3.2.0.tar.gz)
md5sums=('2f60f32efbaefa4a31f64c40f782dfdc')

package() {
cd $srcdir/$pkgname-$pkgver
make DESTDIR="$pkgdir/" install
}
