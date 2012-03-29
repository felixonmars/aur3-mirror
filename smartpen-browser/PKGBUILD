# Maintainer: <themanifold@gmail.com>

pkgname=smartpen-browser
pkgver=20120329
pkgrel=1
pkgdesc="A tool for viewing pages and exporting PDFs from a smart pen"
arch=('i686', 'x86_64')
url="https://github.com/srwalter/smartpen-browser"
license=('GPL2')
groups=()
depends=('openobex' 'python2' 'pygtk' 'libsmartpen-git' 'python2-libsmartpen' 'python2-dateutil' )
makedepends=('git' 'pyrex')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()

_gitroot=git://github.com/srwalter/smartpen-browser.git
_gitname=smartpen-browser

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."
	
	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi
	
	msg "GIT checkout done or server timeout"
}

package() {
	cd "$srcdir/$_gitname"
	msg "Upgrading from python2.6 to python2.7"
	2to3-2.7 -w $pkgname'.py' || return 1
	sed -i 's/_thread/thread/g' $pkgname'.py' || return 1
	sed -i '1,1d' $pkgname'.py' || return 1
	sed -i '1 i\#!/usr/bin/python2.7' $pkgname'.py' || return 1
	make DESTDIR="$pkgdir" install || return 1
}
	
