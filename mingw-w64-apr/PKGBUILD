pkgname=mingw-w64-apr
pkgver=1.4.6
pkgrel=2
pkgdesc="The Apache Portable Runtime (mingw-w64)"
arch=(any)
url="http://apr.apache.org"
license=("APACHE")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt)
options=(staticlibs !strip !buildflags)
source=("http://www.apache.org/dist/apr/apr-${pkgver}.tar.bz2")
md5sums=('ffee70a111fd07372982b0550bbb14b7')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd "$srcdir/apr-$pkgver"
	sed -i "s,#define APR_OFF_T_STRFN         strtoi,#define APR_OFF_T_STRFN         _strtoi64," "include/arch/win32/apr_private.h"
	for _arch in ${_architectures}; do
		unset LDFLAGS
		mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		cp -r "$srcdir/apr-$pkgver/"* "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		if [ $_arch = "x86_64-w64-mingw32" ]; then
			sed -i 's,as_fn_error $? "could not determine the proper format for apr_ssize_t" "$LINENO" 5,dummyvar=1,g' configure
			sed -i 's,ssize_t_fmt="#define APR_SSIZE_T_FMT \"$ssize_t_fmt\"",ssize_t_fmt="#define APR_SSIZE_T_FMT \"lld\"",g' configure
			sed -i 's,as_fn_error $? "could not determine the proper format for apr_size_t" "$LINENO" 5,dummyvar2=1,g' configure
			sed -i 's,size_t_fmt="#define APR_SIZE_T_FMT \"$size_t_fmt\"",size_t_fmt="#define APR_SIZE_T_FMT \"lld\"",g' configure
		fi
		./configure \
			--prefix=/usr/${_arch} \
			--build=$CHOST \
			--host=${_arch} \
			--target=${_arch} \
			--enable-threads \
			--enable-other-child
		sed -i "s,LDFLAGS=,LDFLAGS=-no-undefined," "build/apr_rules.mk"
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
