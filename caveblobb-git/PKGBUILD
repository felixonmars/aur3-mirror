# Maintainer: Stephan Platz <aur@paalsteek.de>
pkgname=caveblobb-git
pkgver=20110630
pkgrel=1
pkgdesc="Guide through a dangerous cave"
arch=(i686 x86_64)
url="http://github.com/ebrnd/caveblobb"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_gfx' 'boost')
makedepends=('patch' 'git' 'cmake' 'gcc' 'make')
source=('makefile.patch')
md5sums=('1b42bc066efd7c41bd7544875b4d9621')

_gitroot="https://github.com/eBrnd/caveblobb.git"
_gitname="caveblobb.git"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	patch -N < ../makefile.patch || return 0

	make PREFIX=/usr release
}

package() {
	cd "$srcdir/$_gitname-build"
		make PREFIX=/usr DESTDIR="$pkgdir/" install
} 
