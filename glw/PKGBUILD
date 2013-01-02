pkgname=glw
pkgver=8.0.0
pkgrel=1
pkgdesc="contains the source code for SGI's OpenGL Xt/Motif widgets, slightly modified to work better with Mesa"
arch=('any')
url="http://mesa3d.org/"
license=('custom')
depends=('xorg-server' 'mesa')
source=(ftp://ftp.freedesktop.org/pub/mesa/glw/glw-8.0.0.tar.bz2)
md5sums=('b29b8b5481b8cbc839cb02c324bdabd9')

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
