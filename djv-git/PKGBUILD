# Maintainer: N30N <archlinux@alunamation.com>
# Contributer: Jonathan Liu <net147@gmail.com>

pkgname="djv-git"
provides=("djv")
pkgver=1.0.5.r65.ga631914
pkgrel=1
pkgdesc="Image sequence and movie playback and processing software for film production, VFX, and computer animation"
url="http://djv.sourceforge.net/"
license=("BSD")
arch=("i686" "x86_64")
depends=("desktop-file-utils" "qt5-base" "glew" "ffmpeg" "libjpeg" "libpng" "libtiff" "libquicktime" "openexr")
makedepends=("cmake" "qt5-tools" "portaudio")
options=("!docs")
install="${pkgname}.install"
source=("${pkgname}::git://git.code.sf.net/p/djv/git")
md5sums=("SKIP")

pkgver() {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	rm -fr build
	mkdir build
	cd build
	cmake -D CMAKE_INSTALL_PREFIX:PATH=/usr "../${pkgname}"
	make
}

package() {
	install -Dm644 "${pkgname}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cd build
	make DESTDIR=${pkgdir} install
}

# vim: set noet ff=unix
