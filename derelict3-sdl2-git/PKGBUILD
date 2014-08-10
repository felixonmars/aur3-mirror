# Maintainer: Fredrik Andersson <rfaa@gmx.com>
pkgname=derelict3-sdl2-git
pkgver=20140809
pkgrel=2
pkgdesc="Derelict3SDL2 - SDL2 bindings for the D language."
arch=('x86_64')
license=('Boost')
depends=(
	'dmd'
	'sdl2'
	'sdl2_image'
	'sdl2_mixer'
	'sdl2_ttf'
	'sdl2_net'
	'derelict3-util-git'
)
makedepends=('git')
url="https://github.com/DerelictOrg/DerelictSDL2"
provides=('derelict3-sdl2')

_gitroot='git://github.com/DerelictOrg/DerelictSDL2.git'
_gitname='derelict3-sdl2'

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout."
}

package() {
	mkdir -p "$pkgdir/usr/include/dlang/dmd/"
	cp -r "$srcdir/$_gitname/source/derelict/" "$pkgdir/usr/include/dlang/dmd/"
}
