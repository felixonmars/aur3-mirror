# Maintainer: stylish-mushroom <stylish.mushroom@gmail.com>

pkgname=alpaca
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimalist package manager (bash yaourt/pacman wrapper)"
arch=('any')
url="http://arch-alpaca.googlecode.com"
license=('GPL')
depends=('yaourt' 'sudo')
source=(http://arch-alpaca.googlecode.com/files/alpaca-1.0.0.tar.gz)
md5sums=('4e2992928dea667913c271b1b6baeb71')

package() {
cd $srcdir/$pkgname-$pkgver
make DESTDIR="$pkgdir/" install
}
