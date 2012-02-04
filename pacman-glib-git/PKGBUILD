# Maintainer: PirateJonno <j@skurvy.no-ip.org>

_pkgname=pacman-glib
pkgname="$_pkgname-git"
pkgver=20100620
pkgrel=1
pkgdesc='GLib library for Arch Linux package management'
arch=('i686' 'x86_64')
url="http://github.com/PirateJonno/pacman-glib"
license=('GPL')
depends=('pacman>=3.4.0' 'pacman<3.5.0' 'glib2')
makedepends=('git' 'gnome-common' 'gtk-doc' 'intltool')
provides=("$_pkgname=3.4.0")
conflicts=("$_pkgname")

_gitroot='git://github.com/PirateJonno/pacman-glib.git'
_gitname='pacman-glib'

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."
	
	if [ -d "$_gitname" ]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi
	
	msg "GIT checkout done or server timeout"
	msg "Starting make..."
	
	[ -d "$srcdir/$_gitname-build" ] && rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"
	
	./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
	make -s || return 1
	make -s DESTDIR="$pkgdir" install
}
