# Maintainer: N30N <archlinux@alunamation.com>

pkgname="alembic"
#pkgver=1.0.5
pkgver=1.5.5
pkgrel=1
pkgdesc="An open framework for storing and sharing 3D geometry data"
url="http://opensource.imageworks.com/?p=alembic"
license=("MIT")
arch=("i686" "x86_64")
depends=("hdf5" "pyilmbase")
makedepends=("cmake" "boost" "openexr" "glut")
optdepends=("glut: for SimpleAbcViewer")
source=("http://alembic.googlecode.com/archive/${pkgver//./_0}.tar.gz")
sha1sums=("6ca4fabea10ed28ee1839f0a492caa39b861b2fd")
MAKEFLAGS="-j1"

prepare() {
	[ -d build ] && rm -rf build
	mkdir build

	cd "${pkgname}-${pkgver//./_0}"
	sed "/SET( CMAKE_INSTALL_PREFIX/,+1d" \
		-i CMakeLists.txt
	sed "s/BOOST_PYTHON_LIBRARY/Boost_PYTHON_LIBRARY/g" \
		-i python/examples/AbcView/CMakeLists.txt
}

build() {
	cd build
	cmake -DLIBPYTHON_VERSION=2.7 \
		-DBoost_PYTHON_LIBRARY_RELEASE="/usr/lib/libboost_python.so" \
		-DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
		"../${pkgname}-${pkgver//./_0}"
	make
}

check() {
	cd build
	make test
}

package() {
	install -Dm644 "${pkgname}-${pkgver//./_0}/LICENSE.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cd build
	make install
	rm -r "${pkgdir}/usr/lib/static/"
}

# vim: set noet ff=unix:
