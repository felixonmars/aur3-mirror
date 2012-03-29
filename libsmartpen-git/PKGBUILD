# Maintainer: <themanifold@gmail.com>

pkgname=libsmartpen-git
pkgver=20120329
pkgrel=1
pkgdesc="A library for communicating with the Livescribe Pulse Smartpen."
arch=('i686', 'x86_64')
url="https://github.com/srwalter/libsmartpen"
license=('GPL2')
groups=()
depends=('openobex' 'python2')
makedepends=('git' 'pyrex')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()

_gitroot=git://github.com/srwalter/libsmartpen.git
_gitname=libsmartpen

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
	msg "Starting build..."
	
	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	
	cd "$srcdir/$_gitname-build"
	msg "The Makefile should use python2.6... "
	make LOCAL_CFLAGS="-Wall -fPIC -I/usr/include/python2.6 `pkg-config --cflags glib-2.0 openobex libusb-1.0` -g"
}

package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir" install || return 1
}
