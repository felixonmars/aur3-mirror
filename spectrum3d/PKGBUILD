# Maintainer: Your Name <youremail@domain.com>
pkgname=spectrum3d
pkgver=2.5.0
pkgrel=2
pkgdesc="3d spectrum analyser"
arch=(i686 x86_64)
url="http://spectrum3d.sourceforge.net/"
license=('GPL')
depends=('gstreamer0.10-good-plugins' 'sdl' 'gtk2')
provides=(spectrum3d)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('1500b28e3f1001c32823c4309bf6c003')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-gtk3
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
