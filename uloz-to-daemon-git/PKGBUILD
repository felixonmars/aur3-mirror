# Maintainer: David Watzke <david@watzke.cz>
 
pkgname=uloz-to-daemon-git
pkgver=20101013
pkgrel=2
pkgdesc="a daemon that can download from the uloz.to sharing service"
url="http://gitorious.org/uloz-to"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt>=4.6.0' 'libmad')
makedepends=('cmake' 'git')
provides=('uloz-to-daemon')

_gitname="uloz-to-daemon"
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
	install -D -m 0644 data/samples "$pkgdir/usr/share/$_gitname/samples"
}
