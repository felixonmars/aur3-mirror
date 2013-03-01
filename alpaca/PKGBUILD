# Maintainer: stylish-mushroom <stylish.mushroom@gmail.com>

pkgname=alpaca
pkgver=4.1.2
pkgrel=1
pkgdesc="Minimalist official+AUR package manager, with update reminder (bash pacman/makepkg interface)"
arch=('any')
url="http://arch-alpaca.googlecode.com"
license=('GPL')
depends=(bash curl grep sudo pacman libnotify xfce4-notifyd)
source=(http://arch-alpaca.googlecode.com/files/alpaca-4.1.2.tar.gz)
md5sums=('9956a45a739089b85435ba33015b2cd9')

package() {
cd $srcdir/$pkgname-$pkgver
make DESTDIR="$pkgdir/" install
}
