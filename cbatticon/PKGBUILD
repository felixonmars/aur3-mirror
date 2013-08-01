# Maintainer: Valère Monseur (valr) <valere dot monseur at ymail dot com>

pkgname=cbatticon
pkgver=1.3.2
pkgrel=1
pkgdesc="A lightweight and fast battery icon that sits in your system tray"
arch=(i686 x86_64 arm)
url="https://github.com/ColinJones/cbatticon"
license=('GPL2')
depends=('libnotify' 'gtk2')
provides=('cbatticon')
conflicts=('cbatticon-git')
source=(https://github.com/ColinJones/$pkgname/archive/$pkgver.tar.gz)
md5sums=('dc5aa5265e346dc382932dc69c7cc778')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}
