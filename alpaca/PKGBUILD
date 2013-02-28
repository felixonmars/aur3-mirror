# Maintainer: stylish-mushroom <stylish.mushroom@gmail.com>

pkgname=alpaca
pkgver=4.0.0
pkgrel=1
pkgdesc="Minimalist official+AUR package manager with update reminders (bash pacman/makepkg interface)"
arch=('any')
url="http://arch-alpaca.googlecode.com"
license=('GPL')
depends=(bash curl grep sudo pacman cronie libnotify xfce4-notifyd)
source=(http://arch-alpaca.googlecode.com/files/alpaca-4.0.0.tar.gz)
md5sums=('975e095bf27f23494ab8b930c16e95e6')

package() {
cd $srcdir/$pkgname-$pkgver
make DESTDIR="$pkgdir/" install
}
