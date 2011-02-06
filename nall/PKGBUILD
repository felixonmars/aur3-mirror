# Contributor: Benoit Rouits <brouits@free.fr>

pkgname=nall
pkgver=1.0
pkgrel=1
pkgdesc="A simple, non-intrusive, everything notifier in the system tray"
arch=('i686' 'x86_64')
url="http://herewe.servebeer.com/nall"
license=('GPL')
depends=('libnotify')
makedepends=('pkg-config')
source=(http://herewe.servebeer.com/nall/releases/$pkgname-$pkgver.tar)
md5sums=('e5fb9cb30e40f09a799319cde9fd5de9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
  make DESTDIR="$pkgdir" install
}

