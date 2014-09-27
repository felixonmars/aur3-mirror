# Maintainer: Ian A. Leith <ian@sigilion.com>

pkgname=macbacklight
pkgver=1.4
pkgrel=1
pkgdesc="A very simple application that changes MacBooks' screen backlight level."
arch=("x86_64")
url="https://github.com/sigilion/macbacklight/"
license=('BSD')
source=("https://github.com/sigilion/$pkgname/archive/v${pkgver}.zip")
md5sums=('a1b3511dd42a3127f55ca8c8419f6072')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr/ install
  chmod 4755 "$pkgdir/usr/bin/$pkgname"
}
