pkgname=mingw-w64-serf
pkgver=1.2.0
pkgrel=1
pkgdesc="High-performance asynchronous HTTP client library (mingw-w64)"
arch=(any)
url="http://code.google.com/p/serf"
license=("Apache")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt
mingw-w64-apr-util
mingw-w64-openssl
mingw-w64-zlib)
options=(!libtool !strip !buildflags)
source=("http://serf.googlecode.com/files/serf-${pkgver}.tar.bz2")
md5sums=('e0055adfb422f30bb5daae29d15df607')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	for _arch in ${_architectures}; do
		unset LDFLAGS
		mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		${srcdir}/${pkgname#mingw-w64-}-${pkgver}/configure \
			--prefix=/usr/${_arch} \
			--build=$CHOST \
			--host=${_arch} \
			--target=${_arch} \
			--with-apr=/usr/${_arch} \
			--with-openssl=/usr/${_arch} \
			--with-apr-util=/usr/${_arch}
		make
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		make DESTDIR="$pkgdir" install
		find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
		find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
	done
}