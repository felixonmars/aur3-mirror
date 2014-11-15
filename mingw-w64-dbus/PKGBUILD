# Contributor: Filip Brcic <brcha@gna.org>
pkgname=mingw-w64-dbus
pkgver=1.8.10
pkgrel=1
arch=(any)
pkgdesc="Freedesktop.org message bus system (mingw-w64)"
depends=(mingw-w64-crt mingw-w64-expat)
makedepends=(mingw-w64-gcc mingw-w64-pkg-config mingw-w64-configure)
options=(!strip !buildflags staticlibs)
license=("custom, GPL")
url="http://www.freedesktop.org/wiki/Software/dbus"
source=("http://dbus.freedesktop.org/releases/dbus/dbus-$pkgver.tar.gz"{,.asc})
md5sums=('6be5ef99ae784de9d04589eb067fe038'
         'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "${srcdir}/dbus-${pkgver}"
	sed -i 's,THREAD_LIBS="$THREAD_LIBS -lrt",THREAD_LIBS="$THREAD_LIBS",' configure
}

build() {
	cd "${srcdir}/dbus-${pkgver}"
	unset LDFLAGS
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-configure \
			--target=${_arch} \
			--with-xml=expat \
			--disable-systemd \
			--disable-tests \
			--disable-Werror \
			--disable-asserts
		make
		popd
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/dbus-${pkgver}/build-${_arch}"
		make DESTDIR="${pkgdir}" install
		find "${pkgdir}/usr/${_arch}" -name "*.exe" -o -name "*.bat" -o -name "*.def" -o -name "*.exp" | xargs -rtl1 rm
		find "${pkgdir}/usr/${_arch}" -name "*.dll" -exec ${_arch}-strip --strip-unneeded {} \;
		find "${pkgdir}/usr/${_arch}" -name "*.a" -o -name "*.dll" | xargs -rtl1 ${_arch}-strip -g
		rm -rf "${pkgdir}/usr/${_arch}/"{etc,var,libexec,share}
	done
}
