# Maintainer: Oliver Goethel <godeezy at gmail.com>
# Contributor: Alexander Krimm alex@wirew0rm.de

pkgname=tk-togl-legacy-netgen
pkgver=1.7
pkgrel=2
pkgdesc="A Tcl/Tk widget for OpenGL rendering."
depends=('tk' 'freeglut' 'mesa' 'libxmu')
conflicts=('tk-togl')
arch=('i686' 'x86_64')
license=('BSD')
url="http://togl.sourceforge.net"

options=(!libtool)

source=($pkgname-$pkgver.tar.gz::http://downloads.sourceforge.net/project/togl/Togl/$pkgver/Togl-$pkgver.tar.gz)
md5sums=('0e7da2559513b064dbb0934dc128b46d')


prepare() {
  mv "$srcdir/Togl-$pkgver" "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr 
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # Copy the license
  install -Dm 664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Create Symlink in /usr/lib/
  cd "$pkgdir/usr/lib/"
  ln -s libTogl1.7.so Togl$pkgver/libTogl.so
  ln -s Togl$pkgver/libTogl1.7.so libTogl.so.1.7
  ln -s libTogl.so.1.7 libTogl.so
}
