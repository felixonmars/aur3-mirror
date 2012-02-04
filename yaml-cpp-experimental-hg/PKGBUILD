# Maintainer: Daniel Kirchner <ekpyron@lavabit.com>
pkgname=yaml-cpp-experimental-hg
pkgver=439
pkgrel=1
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec, experimental API"
url="http://code.google.com/p/yaml-cpp/"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('cmake' 'mercurial')
conflicts=('yaml-cpp')
_hgroot="https://code.google.com/p"
_hgrepo="yaml-cpp"

build() {
	cd "$srcdir/$_hgrepo"
	msg "Updating to new API..."
	hg up new-api || return 1

	msg "Starting make..."

	rm -rf "$srcdir/$_hgrepo-build"
	mkdir "$srcdir/$_hgrepo-build"
	cd "$srcdir/$_hgrepo-build"
	
	cmake ../$_hgrepo -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$_hgrepo-build"
	make DESTDIR=$pkgdir install
}
