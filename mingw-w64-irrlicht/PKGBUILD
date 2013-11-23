pkgname=mingw-w64-irrlicht
pkgver=1.8.1
pkgrel=1
pkgdesc="An open source high performance realtime 3D graphics engine. (mingw-w64)"
arch=(any)
url="http://irrlicht.sourceforge.net"
license=("ZLIB")
makedepends=(mingw-w64-gcc dos2unix)
depends=(mingw-w64-crt)
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/irrlicht/irrlicht-$pkgver.zip")
md5sums=('db97cce5e92da9b053f4546c652e9bd5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "$srcdir"
	find . -type f -exec dos2unix {} \;
}

build() {
  for _arch in ${_architectures}; do
		unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}-shared" "${srcdir}/${pkgname}-${pkgver}-build-${_arch}-static"
    cp -r "${srcdir}/irrlicht-${pkgver}/"* "${srcdir}/${pkgname}-${pkgver}-build-${_arch}-shared"
    cp -r "${srcdir}/irrlicht-${pkgver}/"* "${srcdir}/${pkgname}-${pkgver}-build-${_arch}-static"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}-shared/source/Irrlicht"
    if [ ${_arch} = "x86_64-w64-mingw32" ]; then
			sed -i "s,-ld3dx9d,,g" Makefile
		fi
    CXX=${_arch}-g++ CC=${_arch}-gcc AR=${_arch}-ar make NDEBUG=1 sharedlib_win32
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}-static/source/Irrlicht"
    CXX=${_arch}-g++ CC=${_arch}-gcc AR=${_arch}-ar make NDEBUG=1 staticlib_win32
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}-shared"
    install -Dm644 "bin/Win32-gcc/Irrlicht.dll" "${pkgdir}/usr/${_arch}/bin/Irrlicht.dll"
    install -Dm644 "lib/Win32-gcc/libIrrlicht.a" "${pkgdir}/usr/${_arch}/lib/libIrrlicht.dll.a"
    mkdir -p "${pkgdir}/usr/${_arch}/include/irrlicht"
    cp "include/"*.h "${pkgdir}/usr/${_arch}/include/irrlicht"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}-static"
    install -m644 "lib/Win32-gcc/libIrrlicht.a" "${pkgdir}/usr/${_arch}/lib/"
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}
