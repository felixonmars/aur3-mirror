# Maintainer: Magnus Bjerke Vik <mbvett at gmail dot com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>

pkgname=lib32-ftgl
_pkgver=2.1.3-rc5
pkgver=2.1.3rc5
pkgrel=3
pkgdesc="OpenGL library to use arbitrary fonts"
arch=(i686 x86_64)
url="http://ftgl.wiki.sourceforge.net/"
license=(MIT)
depends=(lib32-freetype2 lib32-mesa)
makedepends=(doxygen glut)
options=('!libtool')
source=("http://downloads.sourceforge.net/ftgl/ftgl-$_pkgver.tar.bz2")
md5sums=('c7879018cde844059495b3029b0b6503')

build() {
  cd "$srcdir/ftgl-${_pkgver/-/~}"
  sed -i '/^SUBDIRS =/s/demo//' Makefile.in
  ./configure --prefix=/usr --with-pic --disable-static --libdir=/usr/lib32 CXX="g++ -m32" CC="gcc -m32"
  make
}

package() {
  cd "$srcdir/ftgl-${_pkgver/-/~}"
  make DESTDIR="$pkgdir" install
  
  rm -rf ${pkgdir}/usr/{../etc,bin,include,share}
}
