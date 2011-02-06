# Contributor:  Ondrej Martinak <omartinak@gmail.com

pkgname=musca-bzr
pkgver=213
pkgrel=1
pkgdesc="A simple dynamic window manager for X, with features nicked from ratpoison and dwm"
url="http://aerosuidae.net/musca.html"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('libx11' 'dmenu')
makedepends=('gcc' 'gcc-libs' 'make' 'bzr')
conflicts=('musca')
provides=('musca')
source=()
md5sums=()

_bzrbranch=lp:musca
_bzrname=musca

build() {
	cd ${srcdir}

	msg "Connecting to BZR server..."

	if [ -d ${srcdir}/${_bzrname} ] ; then
		cd ${_bzrname} && bzr pull ${_bzrbranch}
		cd ..
		msg "The local files are updated."
	else
		bzr co ${_bzrbranch}
	fi

	msg "BZR checkout done or server timeout"
	msg "Starting make..."

	[ -d ./${_bzrname}-build ] && rm -rf ./${_bzrname}-build
	cp -r ./${_bzrname} ./${_bzrname}-build

	cd ./${_bzrname}-build

	make || return 1
	install -Dm755 musca $pkgdir/usr/bin/musca
	install -Dm644 musca.1 $pkgdir/usr/share/man/man1/musca.1
}

