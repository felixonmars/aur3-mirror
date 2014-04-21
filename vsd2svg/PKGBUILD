# Maintainer: Felipe Weckx <felipe.weckx@gmail.com>
pkgname=vsd2svg
pkgver=0.1.0
pkgrel=1
pkgdesc="You can use vsd2svg to convert VSD files to SVG."
arch=('x86_64' 'i686')
url="http://dia-installer.de/vsd2svg/"
license=('GPL')
groups=()
depends=('libvisio')
source=("http://downloads.sourceforge.net/vsd2svg/$pkgname-$pkgver.tar.xz")
md5sums=('8718571f527cde3fc4ed3c9788016038')
build() {
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
