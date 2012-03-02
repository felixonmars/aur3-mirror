# Maintainer: Devan <wilsonevangelista at gmail dot com>

_pkgbasename=glfw
pkgname=lib32-$_pkgbasename
pkgver=2.7.3
pkgrel=1
pkgdesc="A free, open source, portable framework for OpenGL application development (32 Bit)"
arch=('x86_64')
url="http://www.glfw.org/"
license=('custom:ZLIB')
depends=('lib32-libgl' 'lib32-libxrandr')
makedepends=('lib32-mesa')
source=("http://switch.dl.sourceforge.net/sourceforge/${_pkgbasename}/${_pkgbasename}-$pkgver.tar.bz2")
md5sums=('f0e40049cc3ef30cb145047a7631ab3f')

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  export CC="gcc -m32" LDFLAGS="-m32 -L/lib32 -L/usr/lib32 -Wl,-rpath,/lib32 -Wl,-rpath,/usr/lib32"
  sed -i 's|/lib|/lib32|' lib/x11/Makefile.x11.in
  export LFLAGS+="-lrt"
  make x11
}

package() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  make PREFIX="$pkgdir/usr" x11-dist-install

  # license
  #install -Dm644 COPYING.txt \
  # "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  # docs
  #install -d "$pkgdir/usr/share/doc/$pkgname"
  #install -Dm644 docs/*.pdf "$pkgdir/usr/share/doc/$pkgname"

  # fix pc file prefix path
  sed -i "s|$pkgdir||g" "$pkgdir/usr/lib32/pkgconfig/lib$_pkgbasename.pc"
  sed -i "s|libdir=\${exec_prefix}/lib|libdir=\${exec_prefix}/lib32|g" "$pkgdir/usr/lib32/pkgconfig/lib$_pkgbasename.pc"
  rm -rf $pkgdir/usr/include/
}
