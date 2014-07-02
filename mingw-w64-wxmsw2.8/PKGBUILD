pkgname=mingw-w64-wxmsw2.8
epoch=1
pkgver=2.8.12
pkgrel=1
pkgdesc="Win32 implementation of wxWidgets 2.8 API for GUI (mingw-w64)"
arch=(any)
url="http://wxwidgets.org"
license=("custom:wxWindows")
makedepends=(mingw-w64-gcc)
depends=(mingw-w64-crt mingw-w64-libpng mingw-w64-libjpeg-turbo mingw-w64-libtiff)
options=(staticlibs !strip !buildflags)
conflicts=(mingw-w64-wxmsw2.8)
provides=(mingw-w64-wxmsw2.8)
replaces=(mingw-w64-wxmsw2.6)
source=("http://downloads.sourceforge.net/wxwindows/wxMSW-${pkgver}.tar.bz2")
#"http://downloads.sourceforge.net/wxpython/wxGTK-collision.patch")
sha1sums=('39552f3e49341197fea8373824ec609c757e890b')

# _architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_architectures="i686-w64-mingw32"

build() {
	for _arch in ${_architectures}; do
		unset LDFLAGS
		mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		"${srcdir}"/wxMSW-$pkgver/configure \
			--prefix=/usr/${_arch} \
			--build=$CHOST \
			--host=${_arch} \
			--with-msw \
			--enable-unicode \
			--enable-shared \
			--enable-monolithic \
			--disable-precomp-headers \
			--with-libpng=sys \
			--with-libxpm=builtin \
			--with-libjpeg=sys \
			--with-libtiff=sys
			# --enable-stl \
			# --with-regex=builtin \
			# --with-opengl \
			# --disable-mslu \
			# --enable-graphics_ctx \
			# --enable-webview \
			# --enable-mediactrl 
		make
	done
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	for _arch in ${_architectures}; do
		cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		make DESTDIR="$pkgdir" install
		mv "$pkgdir/usr/${_arch}/lib/"*.dll "$pkgdir/usr/${_arch}/bin"
		find "$pkgdir/usr/${_arch}" -name '*.exe' | xargs -rtl1 rm
		find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
		ln -s "/usr/${_arch}/lib/wx/config/${_arch}-msw-unicode-${pkgver%.*}" "$pkgdir/usr/bin/${_arch}-wx-config"
		# rm "$pkgdir/usr/${_arch}/bin/wxrc*"
		rm -r "$pkgdir/usr/${_arch}/share"
		mv "$pkgdir/usr/bin/${_arch}-wx-config" "$pkgdir/usr/bin/${_arch}-wx-config-2.8"
		mv "$pkgdir/usr/${_arch}/bin/wx-config" "$pkgdir/usr/${_arch}/bin/wx-config-2.8"
	done
}
