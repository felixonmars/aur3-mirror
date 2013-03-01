# Maintainer: stylish-mushroom <stylish.mushroom@gmail.com>

pkgname=alpaca
pkgver=4.1.1
pkgrel=1
pkgdesc="Minimalist official+AUR package manager, with update reminder (bash pacman/makepkg interface)"
arch=('any')
url="http://arch-alpaca.googlecode.com"
license=('GPL')
depends=(bash curl grep sudo pacman libnotify xfce4-notifyd)
source=(http://arch-alpaca.googlecode.com/files/alpaca-4.1.1.tar.gz)
md5sums=('b0a11fa5f81d13b239021f70a926f579')

package() {
cd $srcdir/$pkgname-$pkgver
make DESTDIR="$pkgdir/" install
}
