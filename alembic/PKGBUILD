# Maintainer: N30N <archlinux@alunamation.com>
# Contributor: Peter Shinners <pete@shinners.org>

pkgname="alembic"
pkgver=1.5.5
pkgrel=3
pkgdesc="An open framework for storing and sharing 3D geometry data"
url="http://alembic.io"
license=("MIT")
arch=("i686" "x86_64")
depends=("hdf5")
makedepends=("mercurial" "cmake" "boost" "openexr" "glut" "python2-ilmbase")
optdepends=("python2-ilmbase: for python2 bindings" \
	"glut: for SimpleAbcViewer" \
	"glu: for SimpleAbcViewer")
source=("hg+https://code.google.com/p/alembic/#tag=${pkgver//./_0}")
md5sums=("SKIP")
options=("!makeflags" "!buildflags")

prepare() {
	[ -d build ] && rm -rf build
	mkdir build

	cd "${pkgname}"
	sed "/SET( CMAKE_INSTALL_PREFIX/,+1d" \
		-i CMakeLists.txt
	sed "s/BOOST_PYTHON_LIBRARY/Boost_PYTHON_LIBRARY/g" \
		-i python/examples/AbcView/CMakeLists.txt
}

build() {
	cd build
	cmake \
		-DBUILD_SHARED_LIBS=1 \
		-DLIBPYTHON_VERSION=2.7 \
		-DBoost_PYTHON_LIBRARY_RELEASE="/usr/lib/libboost_python.so" \
		-DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
		"../${pkgname}"
	make
}

check() {
	cd build
	make test
}

package() {
	install -Dm644 "${pkgname}/LICENSE.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cd build
	make install

	cd "${pkgdir}/usr/lib/"
	install -d python2.7/site-packages
	mv alembicmodule.so alembicglmodule.so python2.7/site-packages
}

# vim: set noet ff=unix:
