# Contributor: André Klitzing <aklitzing () online () de>
pkgname=mingw32-expat
pkgver=2.1.0
pkgrel=1
pkgdesc="The Expat XML Parser (mingw32)"
arch=(any)
url="http://expat.sourceforge.net/"
options=(!strip !buildflags) # no !libtool because mingw32-cairo will complain and fail
license=('MIT')
depends=(mingw32-runtime)
makedepends=('mingw32-gcc' 'mingw32-binutils')
source=("http://switch.dl.sourceforge.net/sourceforge/expat/expat-$pkgver.tar.gz")
md5sums=('dd7dab7a5fea97d2a6a43f511449b7cd')

build() {
  cd "$srcdir/expat-$pkgver"
  unset LDFLAGS
  mkdir -p build && cd build
  ../configure \
  --prefix=/usr/i486-mingw32 \
  --host=i486-mingw32
  make
}

package() {
  cd "$srcdir/expat-$pkgver/build"
  make DESTDIR=$pkgdir install
  i486-mingw32-strip "$pkgdir/usr/i486-mingw32/bin/xmlwf"
  i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  rm -rf "$pkgdir/usr/i486-mingw32/man"
}

