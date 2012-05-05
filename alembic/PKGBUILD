# Maintainer: N30N <archlinux@alunamation.com>

pkgname="alembic"
pkgver=1.0.5
pkgrel=1
pkgdesc="An open framework for storing and sharing 3D geometry data"
url="http://opensource.imageworks.com/?p=alembic"
license=("MIT")
arch=("i686" "x86_64")
depends=("hdf5")
makedepends=("cmake" "boost" "ilmbase" "openexr" "glut")
optdepends=("ilmbase: for SimpleAbcViewer" \
	"libgl: for SimpleAbcViewer" \
	"glut: for SimpleAbcViewer")
source=("http://alembic.googlecode.com/files/alembic-${pkgver}.tar.bz2")
sha1sums=("56d32e2aca7d1a92dd3d0b3442653f872fa87343")
MAKEFLAGS="-j1"

# alembic E: Dependency ilmbase detected and not included (libraries ['usr/lib/libHalf.so.6', 'usr/lib/libIex.so.6'] needed in files ['usr/bin/SimpleAbcViewer'])
# alembic E: Dependency nvidia-utils detected and not included (libraries ['usr/lib/libGL.so.1'] needed in files ['usr/bin/SimpleAbcViewer'])
# alembic E: Dependency freeglut detected and not included (libraries ['usr/lib/libglut.so.3'] needed in files ['usr/bin/SimpleAbcViewer'])

build() {
	sed "/SET( CMAKE_INSTALL_PREFIX/,+1d" -i "${pkgname}-${pkgver}/CMakeLists.txt"

	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" "../${pkgname}-${pkgver}"
	make
}

check() {
	cd build
	make test
}

package() {
	install -Dm644 "${pkgname}-${pkgver}/LICENSE.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cd build
	make install
}

# vim: set noet ff=unix:
