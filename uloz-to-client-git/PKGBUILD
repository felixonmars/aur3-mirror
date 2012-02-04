# Maintainer: David Watzke <david@watzke.cz>
 
pkgname=uloz-to-client-git
pkgver=20101013
pkgrel=2
pkgdesc="a Qt 4 client for uloz-to-daemon"
url="http://gitorious.org/uloz-to"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt>=4.6.0' 'uloz-to-daemon-git')
makedepends=('cmake' 'git')
provides=('uloz-to-client')

_gitname="uloz-to-client"
_gitroot="git://gitorious.org/uloz-to/$_gitname.git"

build() {
	cd "$srcdir"
	msg "Connecting to the GIT server...."

	if [ -d "$srcdir/$_gitname" ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
		cd "$srcdir/$_gitname"
	fi

	msg "Either the GIT checkout is done or the server timed out"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	cmake .
	make
}

package() {
	cd "$srcdir/$_gitname-build"

	install -D -m 0755 $_gitname "$pkgdir/usr/bin/$_gitname"
}
