pkgname=mingw-w64-mini18n-svn
pkgver=3105
pkgrel=1
pkgdesc="A a small and non-intrusive translation library designed for small memory and non-GNU systems. (mingw-w64)"
arch=(any)
url="http://wiki.yabause.org/index.php5?title=Mini18n"
license=("GPL")
makedepends=(mingw-w64-gcc cmake subversion)
depends=(mingw-w64-crt)
options=(!libtool !strip !buildflags)
source=("${pkgname%-*}::svn+https://yabause.svn.sourceforge.net/svnroot/yabause/trunk/mini18n"
"Toolchain-i686-w64-mingw32.cmake"
"Toolchain-x86_64-w64-mingw32.cmake")
md5sums=('SKIP'
				 'da10ad00a161800e0b011a77c3efbf76'
				 'adea9ccdeea1784c7cd30af195f2a8cb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
	cd "$SRCDEST/${pkgname%-*}"
	svnversion
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	for _arch in ${_architectures}; do
		unset LDFLAGS
		mkdir "build-${_arch}" && pushd "build-${_arch}"
		PATH="/usr/${_arch}/bin:$PATH" cmake \
			-DCMAKE_INSTALL_PREFIX:PATH=/usr/${_arch} \
			-DCMAKE_TOOLCHAIN_FILE=${srcdir}/Toolchain-${_arch}.cmake \
			..
		make
		popd
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/${pkgname%-*}/build-${_arch}"
		make DESTDIR="$pkgdir" install
		mkdir -p "$pkgdir/usr/$_arch/bin"
		mv "$pkgdir/usr/${_arch}/lib/"*.dll "$pkgdir/usr/${_arch}/bin"
		find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
		find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
		rm -r "$pkgdir/usr/${_arch}/share"
	done
}
