pkgname=mingw-w64-apr-util
pkgver=1.5.2
pkgrel=1
pkgdesc="The Apache Portable Runtime (mingw-w64)"
arch=(any)
url="http://apr.apache.org"
license=("APACHE")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt
mingw-w64-apr
mingw-w64-expat
mingw-w64-libiconv
mingw-w64-openssl)
options=(staticlibs !strip !buildflags)
source=("http://www.apache.org/dist/apr/apr-util-${pkgver}.tar.bz2")
md5sums=('89c1348aa79e898d7c34a6206311c9c2')

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
			--without-berkeley-db \
			--without-pgsql \
			--without-sqlite3 \
			--with-expat=/usr/${_arch} \
			--with-iconv=/usr/${_arch}
		make CFLAGS="$CFLAGS -DAPU_DECLARE_EXPORT"
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
