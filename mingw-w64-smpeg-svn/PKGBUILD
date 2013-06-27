pkgname=mingw-w64-smpeg-svn
pkgver=408
pkgrel=1
pkgdesc="SDL MPEG Player Library (mingw-w64)"
arch=(any)
url="http://icculus.org/smpeg"
license=("LGPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config subversion)
depends=(mingw-w64-crt mingw-w64-sdl2)
options=(!libtool !strip !buildflags)
source=("${pkgname%-*}::svn+svn://svn.icculus.org/smpeg/trunk")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$SRCDEST/${pkgname%-*}"
  svnversion
}

prepare() {
  cd "$srcdir/${pkgname%-*}"
  ./autogen.sh
}

build() {
	for _arch in ${_architectures}; do
		unset LDFLAGS
		mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		${srcdir}/${pkgname%-*}/configure \
			--prefix=/usr/${_arch} \
			--build=$CHOST \
			--host=${_arch} \
			--disable-sdltest \
			--disable-gtk-player \
			--disable-gtktest \
			--disable-opengl-player \
			--with-sdl-prefix=/usr/${_arch} \
			--without-x
		make
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		make DESTDIR="$pkgdir" install
		find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
		find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
		rm -r "$pkgdir/usr/${_arch}/share"
	done
}
