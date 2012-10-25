# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

# Based on libxkbcommon-git from Joel Teichroeb <joel@teichroeb.net>

pkgname=libxkbcommon-for-qtwayland-git
pkgver=20120918
pkgrel=1
pkgdesc="Translating evdev keycodes to keysyms, needed by Wayland."
url="http://wayland.freedesktop.org/"
arch=(i686 x86_64)
license=('custom')
makedepends=('git' 'xorg-util-macros')
provides=('libxkbcommon')
replaces=('libxkbcommon')
conflicts=('libxkbcommon')
options=(!libtool)

_gitroot="git://anongit.freedesktop.org/xorg/lib/libxkbcommon"
_gitname="libxkbcommon"
_githash="9aee332e9fd470580611d789d8265f983b199fde"

build() {
	msg 'Connecting to git.freedesktop.org GIT server....'

	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin master
	else
		git clone ${_gitroot}
	fi

	cd $_gitname && git checkout $_githash || exit $?

	msg 'GIT checkout done or server timeout'
	msg 'Starting make...'

	# Cleanup and prepare the build dir
	rm -rf ${srcdir}/build
	cp -r ${srcdir}/${_gitname} ${srcdir}/build
	cd ${srcdir}/build

	./autogen.sh --prefix=/usr
	make
}

package() {
	cd ${srcdir}/build

	make DESTDIR=${pkgdir} install
}
