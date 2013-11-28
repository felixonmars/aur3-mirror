pkgname=mingw-w64-librsvg
pkgver=2.40.1
pkgrel=4
pkgdesc="A SVG viewing library (mingw-w64)"
arch=(any)
url="https://live.gnome.org/LibRsvg"
license=("LGPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config gdk-pixbuf2 setconf)
depends=(mingw-w64-crt mingw-w64-gdk-pixbuf2 mingw-w64-pango mingw-w64-libcroco)
options=(staticlibs !strip !buildflags)
source=("http://ftp.gnome.org/pub/gnome/sources/librsvg/${pkgver%.*}/librsvg-$pkgver.tar.xz"
"realpath.c"
"rsvg-base.diff")
sha256sums=('8813b4fe776d5e7acbce28bacbaed30ccb0cec3734eb3632c711a16ebe2961d7'
            'fbc045170a622463ff2094a0fcedcf0c9f8f3d47b01d633e6ebe71b004ded4ce'
            '6370818eb1a4000d9e70acf995152f3337e362903e4c82e962d51e0a2766ff04')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "$srcdir/librsvg-$pkgver"
	cp "$srcdir/realpath.c" .
	patch -Np0 -i "$srcdir/rsvg-base.diff"
}

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    "${srcdir}"/${pkgname#mingw-w64-}-$pkgver/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --disable-introspection \
      --disable-tools
    setconf Makefile AM_CFLAGS '-fno-common'
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
