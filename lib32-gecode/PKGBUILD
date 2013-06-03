# Contributor: Gustavo A. Gomez Farhat <gustavo_dot_gomez_dot_farhat at gmail_dot_com>
# MOdified by hanny
pkgname=lib32-gecode
pkgver=4.0.0
pkgrel=11
pkgdesc="The Generic Constraint Development Environment"
arch=('i686' 'x86_64')
url="http://www.gecode.org"
license=('MIT')
makedepends=('pkgconfig' 'diffutils' 'perl')
depends=('qt4' 'gecode')
source=(http://www.gecode.org/download/gecode-$pkgver.tar.gz)
md5sums=('6d1594b6d431d73bd386b31392b7cfcb')

build() {
  cd "$srcdir/gecode-$pkgver"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --disable-examples
  make
}

package() {
  cd "$srcdir/gecode-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/bin"
  rm -r "$pkgdir/usr/include"
  rm -r "$pkgdir/usr/share"
  mv "$pkgdir/usr/lib" "$pkgdir/usr/lib32"
}

# vim:set ts=2 sw=2 et:
