# Maintainer: Quinn Evans <yoshizuki@gmail.com
pkgname=joyce
pkgver=2.2.5c
pkgrel=1
pkgdesc="An Amstrad PCW emulator."
arch=('i686' 'x86_64')
url="http://www.seasip.demon.co.uk/Unix/Joyce/index.html"
license=('GPL')
depends=('sdl>=1.0.8' 'libpng>=1.0.6' 'libxml2>=2.0.0' )
conflicts=('libdsk')
source=(http://www.seasip.info/Unix/Joyce/$pkgname-2.2.5.tar.gz)
md5sums=('6f3840271940537a56dd16ca9b070bec')

build() {
  echo $srcdir
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
