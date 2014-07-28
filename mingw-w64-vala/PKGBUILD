pkgname=mingw-w64-vala
pkgver=0.24.0
pkgrel=1
pkgdesc="Compiler for the GObject type system (mingw-w64)"
arch=('any')
url="http://live.gnome.org/Vala"
license=('LGPL')
depends=('mingw-w64-glib2')
makedepends=('mingw-w64-libxslt' 'bison' 'mingw-w64-gcc')
options=('!strip' '!buildflags' 'staticlibs')
source=(http://ftp.gnome.org/pub/gnome/sources/vala/${pkgver%.*}/vala-$pkgver.tar.xz)
sha256sums=('22a37c977512c19cd29c373eaaef96cb2c994795d491106f32387f3f9d1e899c')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
    cd vala-$pkgver
    
    aclocal
    unset CFLAGS
    unset LDFLAGS
    
    for _arch in ${_architectures}; do
	mkdir -p build-${_arch}
	cd build-${_arch}
	export PKG_CONFIG_PATH="/usr/${_arch}/lib/pkgconfig"
	
	../configure \
		--enable-vapigen \
		--prefix="/usr/${_arch}" \
		--target="${_arch}" \
		--host="${_arch}" \
		--exec-prefix="/usr/${_arch}"
	make
	
	cd ..
    done
}

package() {
    cd vala-$pkgver
    
    for _arch in ${_architectures}; do
	cd build-${_arch}
	make DESTDIR="$pkgdir" install
	
	${_arch}-strip "${pkgdir}/usr/${_arch}/bin/"*.exe
	${_arch}-strip -x -g "${pkgdir}/usr/${_arch}/bin/"*.dll
	${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
	
	rm -rf "${pkgdir}/usr/${_arch}/share"
	cd ..
    done
}
