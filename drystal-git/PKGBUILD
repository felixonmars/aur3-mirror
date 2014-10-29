# Maintainer: Jérémy Anger <angerj.dev@gmail.com>

pkgname=drystal-git
pkgver=741.eed7865
pkgrel=1
pkgdesc="2D game engine"
arch=('i686' 'x86_64')
url="http://drystal.github.io/"
license=('LGPL3')
depends=('sdl2' 'openal')
makedepends=('git' 'cmake' 'make')
conflicts=()
provides=(drystal)

source=('git+https://github.com/kidanger/drystal.git')
md5sums=('SKIP')
_gitname=drystal

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	git submodule init
	git submodule update

	test -d build || mkdir build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX:PATH=$pkgdir/usr -DCMAKE_BUILD_TYPE=Release
	make
	cd ..
}

package() {
	cd "$srcdir/$_gitname"
	cd build
	make install
}
