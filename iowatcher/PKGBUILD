# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=iowatcher
pkgver=1.0
pkgrel=2
pkgdesc="Program that graphs the results of a blktrace run"
arch=(i686 x86_64)
license=('GPL')
url="http://masoncoding.com/iowatcher/"
conflicts=('blktrace>1.0.5')
source=(https://www.kernel.org/pub/linux/kernel/people/mason/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('6c6fb242fd7ec253140309935d68d0e18decf76568f2d7a96b92c5137fd44909')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" prefix=/usr install

  install -d "$pkgdir/usr/share/doc/$pkgname/"
  install -m0644 README "$pkgdir/usr/share/doc/$pkgname/"
}
