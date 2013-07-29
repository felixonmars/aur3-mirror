# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
# Contributer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=libgme-svn
pkgver=46
pkgrel=1
pkgdesc="Video game music file emulation/playback library"
url="http://code.google.com/p/game-music-emu/"
license="LGPL"
arch=("i686" "x86_64")
provides=(libgme)
conflicts=(libgme)
depends=()
makedepends=(subversion cmake)
source=("libgme::svn+http://game-music-emu.googlecode.com/svn/trunk")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/libgme"
	svnversion
}

build() {
	cd "$srcdir/libgme"

	rm -rf build
	mkdir build
	cd build

	msg "Starting build process."
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/libgme/build"

	make DESTDIR="$pkgdir" install
}

