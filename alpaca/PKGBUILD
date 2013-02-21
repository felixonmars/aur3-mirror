# Maintainer: stylish-mushroom <stylish.mushroom@gmail.com>

pkgname=alpaca
pkgver=3.2.1
pkgrel=1
pkgdesc="Minimalist official/AUR package manager (light, simple bash wrapper pacman/makepkg frontend interface)"
arch=('any')
url="http://arch-alpaca.googlecode.com"
license=('GPL')
depends=(bash curl grep sudo pacman)
source=(http://arch-alpaca.googlecode.com/files/alpaca-3.2.1.tar.gz)
md5sums=('4cc235f70bbde975de2b38512cf602a8')

package() {
cd $srcdir/$pkgname-$pkgver
make DESTDIR="$pkgdir/" install
}
