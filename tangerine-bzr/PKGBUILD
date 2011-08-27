# Contributor: MutantMonkey <mutantmonkey@gmail.com>
pkgname=tangerine-bzr
pkgver=26
pkgrel=3
pkgdesc="An application that allows you to publish music over your local network, using DAAP; development version"
arch=('i686' 'x86_64')
url="https://launchpad.net/tangerine"
license=('GPL3')
# tangerine wants to use its own daap-sharp for some reason
depends=('gtk-sharp-2' 'libsm' 'log4net' 'nini' 'mono-zeroconf' 'taglib-sharp' 'intltool')
makedepends=('bzr')
provides=('tangerine')
conflicts=('tangerine')

_bzrbranch="https://code.launchpad.net/tangerine/trunk"
_bzrmod="tangerine"

build() {
	cd "$srcdir"

	msg "Connecting to BZR server...."

	if [ ! -d ./${_bzrmod} ]; then
		bzr co ${_bzrbranch} ${_bzrmod}
	else
		bzr up ${_bzrmod}
	fi

	msg "BZR checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_bzrmod-build"
	cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
	cd "$srcdir/$_bzrmod-build"

	./autogen.sh --prefix=/usr
	make || return 1
	make DESTDIR="$pkgdir/" install || return 1

	# remove daap-sharp pkgconfig
	rm $pkgdir/usr/lib/pkgconfig/daap-sharp.pc
}
