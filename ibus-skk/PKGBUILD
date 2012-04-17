# Maintainer: eagletmt <eagletmt@gmail.com>
pkgname=ibus-skk
pkgver=1.4.1
pkgrel=1
pkgdesc='Japanese input method SKK engine for IBus'
arch=('i686' 'x86_64')
url='https://github.com/ueno/ibus-skk'
license=('GPL')
depends=('ibus' 'libskk>=0.0.11')
makedepends=('intltool')
source=(https://github.com/downloads/ueno/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --libexecdir=/usr/lib/ibus
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
md5sums=('8c2d5c9cf7b007cdd7fe64433f5ae4f0')
