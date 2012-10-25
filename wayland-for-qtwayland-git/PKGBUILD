# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

# Based on wayland-git from Joel Teichroeb <joel@teichroeb.net>

pkgname=wayland-for-qtwayland-git
pkgver=20120913
pkgrel=1
pkgdesc="A modern display server."
arch=(i686 x86_64)
url="http://wayland.freedesktop.org"
provides=("libwayland-git=${pkgver}" "wayland=0.95")
conflicts=('libwayland-git' 'wayland')
replaces=('libwayland-git')
license=('MIT')
depends=('libffi')
makedepends=('git' 'expat')
options=(!libtool)

_gitroot="git://anongit.freedesktop.org/wayland/wayland"
_gitname="wayland"
_githash="4b681a7fd4bee01c4d3385e69ee47ed3856c2229"

build() {
	msg "Connecting to git.freedesktop.org GIT server...."

	if [ -d $srcdir/$_gitname ] ; then
		cd $_gitname && git pull origin master
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	cd $_gitname && git checkout $_githash || exit $?

	msg "Creating build directory..."
	rm -rf ${srcdir}/$_gitname-build
	cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build

	msg "Starting build..."
	cd ${srcdir}/$_gitname-build

	./autogen.sh --prefix=/usr --disable-documentation
	make
}

package() {
     cd ${srcdir}/$_gitname-build
     make DESTDIR="${pkgdir}" install
}
