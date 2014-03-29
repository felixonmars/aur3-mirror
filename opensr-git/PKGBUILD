# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=opensr-git
pkgver=r372.b25acc3
pkgrel=1
pkgdesc="Opensource multi-genre game based upon Space Rangers 2: Dominators"
arch=('i686' 'x86_64')
url="https://github.com/ObKo/OpenSR"
license=('GPL3')
depends=('boost' 'boost-libs' 'freetype2' 'glu' 'jsoncpp' 'libjpeg-turbo' 'mesa' 'python' 'sdl2' 'sdl2_mixer')
makedepends=('git' 'cmake')
provides=('opensr')
source=("$pkgname"::'git://github.com/ObKo/OpenSR.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	cp Engine/FTFont.cpp python/OpenSR/Engine/FTFont.cpp
	export CXXFLAGS="$CXXFLAGS -fpermissive"
	cmake -D CMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
	install -d "${pkgdir}/usr/share/"
	cp -r data "${pkgdir}/usr/share/OpenSR"
}