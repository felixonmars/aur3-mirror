pkgname=mingw32-chipmunk
pkgver=6.2.0
pkgrel=2
pkgdesc="A high-performance 2D rigid body physics library (mingw32)"
arch=('any')
url="http://chipmunk-physics.net/"
license=('MIT')
makedepends=('mingw32-gcc' 'cmake>=2.8.10')
source=(http://files.slembcke.net/chipmunk/release/Chipmunk-6.x/Chipmunk-${pkgver}.tgz toolchain.cmake)
md5sums=('42c63539976b84f5f643fc0acb1b7127' 'c34c2a9bcb4d09b0cc05c8a1340ce221')
options=(!buildflags !strip !makeflags)

build() {
	cd "${srcdir}/Chipmunk-$pkgver"
	mkdir -p ./build
	cd ./build
	unset LDFLAGS CFLAGS CXXFLAGS
	
	cmake \
		-DCMAKE_TOOLCHAIN_FILE=../toolchain.cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/i486-mingw32/" \
		-DBUILD_DEMOS=OFF \
		..
	make
	
	#- Non-CMake alternative:
	#i486-mingw32-gcc \
	#	-std=gnu99 \
	#	-Iinclude/chipmunk \
	#	-O3 -DNDEBUG -ffast-math \
	#	src/*.c src/constraints/*.c \
	#	-shared \
	#	-o libchipmunk.dll
}

package() {
	cd "$srcdir/Chipmunk-$pkgver/build"
	make install
	
	#- Non-CMake alternative:
	#mkdir "./usr/i486-mingw32/bin"
	#mkdir "./usr/i486-mingw32/lib"
	#mkdir "./usr/i486-mingw32/share"
	#mkdir "./usr/i486-mingw32/share/doc"
	#mkdir "./usr/i486-mingw32/share/doc/chipmunk"
	#cp -r "$srcdir/Chipmunk-$pkgver/include" "./usr/i486-mingw32/"
	#cp -r "$srcdir/Chipmunk-$pkgver/doc" "./usr/i486-mingw32/share/doc/chipmunk/"
	#mv "./usr/i486-mingw32/share/doc/chipmunk/doc" "./usr/i486-mingw32/share/doc/chipmunk/html/"
	#cp "$srcdir/Chipmunk-$pkgver/libchipmunk.dll" "./usr/i486-mingw32/bin"
	#ln -s "/usr/i486-mingw32/bin/libchipmunk.dll" "./usr/i486-mingw32/lib/libchipmunk.dll"
}
