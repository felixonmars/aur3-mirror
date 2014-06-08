pkgname=mingw-w64-mruby
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight Ruby (mingw-w64)"
arch=(i686 x86_64)
url="http://www.mruby.org"
license=("MIT")
depends=(mingw-w64-crt)
makedepends=(bison ruby mingw-w64-gcc mruby)
source=("https://github.com/mruby/mruby/archive/$pkgver.tar.gz"
"build_config.rb")
md5sums=('d9aec6a20fc1add65ee07ff6cf0e1ef2'
         '9fe9ff66c947ed1434e78a263067ae70')
options=(staticlibs !strip !buildflags)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "${srcdir}/mruby-$pkgver"
	cp ../build_config.rb .
}

build() {
	unset LDFAGS
	for _arch in ${_architectures}; do
		unset LDFLAGS
		mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		cp -r "${srcdir}/mruby-${pkgver}/"* "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		sed -i "s,ARCH,${_arch},g" build_config.rb
		make
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
		mkdir -p "$pkgdir/usr/${_arch}/"{include,lib}
		cd include
		find . -type f -exec install -Dm644 {} "$pkgdir/usr/${_arch}/include/"{} \;
		cd ../build/host/lib
		find . -name '*.a' -exec install -Dm644 {} "$pkgdir/usr/${_arch}/lib/"{} \;
		find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
		find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
	done
} 
