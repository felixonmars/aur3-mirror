pkgname=rio
pkgver=20140107
pkgrel=2
pkgdesc="Plan9-like window manager for X11 extracted from plan9port package"
url="http://swtch.com/plan9port/"
license=('custom')
install=rio.install
arch=('i686' 'x86_64')
depends=('libxext' 'libx11')
source=(rio-20140107.tar.gz)
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/usr/share/doc/$pkgname/"
  mkdir -p "$pkgdir/usr/share/man/man1/"
  install -Dm644 rio.html "$pkgdir/usr/share/doc/$pkgname/rio.html"
  gzip rio.man
  install -Dm644 rio.man.gz "$pkgdir/usr/share/man/man1/rio.1.gz"
}

