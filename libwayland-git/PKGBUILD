pkgname=libwayland-git
pkgver=20111128
pkgrel=1
pkgdesc="A modern display server."
arch=(i686 x86_64)
url="http://wayland.freedesktop.org"
license=('LGPLv2')
depends=('expat' 'libffi')
makedepends=('pkgconfig')
options=(!makeflags)

_gitroot="git://anongit.freedesktop.org/wayland/wayland"
_gitname="wayland"

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

	rm -rf ${srcdir}/$_gitname-build
	cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build
	cd ${srcdir}/$_gitname-build
	./autogen.sh --prefix=/usr
	make
}

package() {
     cd ${srcdir}/$_gitname-build
     make DESTDIR="${pkgdir}" install
}
