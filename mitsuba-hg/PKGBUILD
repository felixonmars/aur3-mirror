# Maintainer: N30N <archlinux@alunamation.com>
# Contributer: Alex Combas <blenderwell@gmail.com>

pkgname="mitsuba-hg"
pkgver=2116.b85118cd30d2
pkgrel=1
pkgdesc="A physically based renderer."
url="https://mitsuba-renderer.org/"
license=("GPL3")
arch=("i686" "x86_64")
depends=("xerces-c" "glew" "openexr" "qt4" "collada-dom" "libxxf86vm" "boost-libs")
makedepends=("mercurial" "cmake" "boost" "python" "eigen3")
optdepends=("python: for the bindings")
provides=("mitsuba")
source=("hg+https://www.mitsuba-renderer.org/repos/mitsuba" "mitsuba.install")
sha1sums=("SKIP" "253e9e45e414bbf0ca2b26aad3d1b5f90fdaa3c9")
install="mitsuba.install"

MAKEFLAGS="-j1"
_python_ver="$(python3 -V 2>&1 | grep -o "3\.[0-9]")"


pkgver() {
	cd mitsuba
	echo "$(hg identify -n).$(hg identify -i)"
}

prepare() {
	[ -d build ] && rm -rf build
	mkdir build
	sed -r "s|^(#include <boost/)(spirit/home/)(phoenix/)|\1\3|" \
		-i mitsuba/src/bsdfs/irawan.h
}

build() {
	cd build
	cmake \
		-DPYTHON_LIBRARY="/usr/lib/libpython${_python_ver}m.so" \
		-DPYTHON_INCLUDE_DIR="/usr/include/python${_python_ver}m" \
		-DBoost_PYTHON_LIBRARY="/usr/lib/libboost_python3.so" \
		"${srcdir}/mitsuba"
	make hammersley_pch mtsimport_pch all
}

package() {
	cd build
	install -d \
		"${pkgdir}/usr/bin" \
		"${pkgdir}/usr/lib" \
		"${pkgdir}/usr/share/mitsuba/plugins"

	cd binaries
	install -m755 mitsuba mtsgui mtsimport mtssrv mtsutil "${pkgdir}/usr/bin"
	install -m755 *.so "${pkgdir}/usr/lib"
	install -m755 plugins/* "${pkgdir}/usr/share/mitsuba/plugins"
	install -Dm755 python/mitsuba.so \
		"${pkgdir}/usr/lib/python${_python_ver}/lib-dynload/mitsuba.so"
	find data -type f -exec \
		install -Dm644 "{}" "${pkgdir}/usr/share/mitsuba/{}" \;

	cd "${srcdir}/mitsuba"
	find include -type f -exec \
		install -Dm644 "{}" "${pkgdir}/usr/{}" \;
	install -Dm644 data/linux/mitsuba.desktop \
		${pkgdir}/usr/share/applications/mitsuba.desktop
	install -Dm644 src/mtsgui/resources/mitsuba48.png \
		"${pkgdir}/usr/share/pixmaps/mitsuba48.png"
}

# vim: set noet ff=unix:
