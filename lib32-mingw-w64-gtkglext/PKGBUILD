pkgname=lib32-mingw-w64-gtkglext
pkgver=1.2.0
pkgrel=2
pkgdesc="opengl extensions for gtk2 (mingw-w64, 32-bit)"
arch=(any)
url="http://gtkglext.sourceforge.net"
license=("LGPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt
lib32-mingw-w64-gtk2)
options=(!libtool !strip !buildflags)
source=("http://downloads.sourceforge.net/sourceforge/gtkglext/gtkglext-${pkgver}.tar.bz2"
"gtk2.20.patch"
"gtkglext-1.0.6-pangox.patch")
md5sums=('ed7ba24ce06a8630c07f2d0ee5f04ab4'
         'e5a87ec3f2d0e616c6f32f90c3f7237f'
         '7e35925b3c722717f969558cc627f39f')

_architectures="i686-w64-mingw32"

build() {
  cd "$srcdir/gtkglext-$pkgver"
  patch -Np1 -i ${srcdir}/gtk2.20.patch
  patch -p1 -R -i ${srcdir}/gtkglext-1.0.6-pangox.patch
  autoconf --force
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cp -r "$srcdir/gtkglext-$pkgver/"* "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    ${srcdir}/gtkglext-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --without-x \
      --with-gdktarget=win32 \
      --disable-glibtest \
      --disable-gtktest
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' -o -name '*.manifest' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}