# Maintainer: Adriano Foschi <adriano.src@gmail.com>

pkgname=wayland-eagle-git
pkgver=20090921
pkgrel=1
pkgdesc="Eagle library branch for Wayland display server."
arch=(i686 x86_64)
url="http://mesa3d.org/"
license=('LGPL')
depends=('glproto=1.4.10' 'wayland-libdrm-git' 'wayland-dri2proto-git' 'wayland-mesa-git')
makedepends=('pkgconfig')
options=(!makeflags)

_gitroot="http://cgit.freedesktop.org/~krh/eagle"
_gitname="eagle"

build() {
	msg "Connecting to git.freedesktop.org GIT server...."

	if [ -d $startdir/src/$_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf $startdir/src/$_gitname-build
	cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
	cd $startdir/src/$_gitname-build

	cd "${startdir}/src/eagle-build"
	autoreconf
	./configure --prefix=/usr || return 1
	make || return 1
	make DESTDIR="${pkgdir}" install || return 1

}
