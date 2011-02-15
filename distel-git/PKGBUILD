# Based on the outdated PKGBUILD ver 3.3
pkgname='distel-git'
pkgver=20110215
pkgrel=1
pkgdesc="Distributed Emacs Lisp, or, an Emacs-based IDE for Erlang programming"
url="http://code.google.com/p/distel/"
license='Public Domain'
arch=('i686' 'x86_64')
depends=('emacs' 'erlang')
makedepends=('git')
conflicts=()
provides=('distel')
source=()
md5sums=()

_gitroot="https://github.com/massemanet/distel.git"
_gitname="distel"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	export prefix=$pkgdir/usr
    make || return 1
	make -e install || return 1
}

# Local variables:
# mode: shell-script
# End:
