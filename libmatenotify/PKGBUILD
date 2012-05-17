# Maintainer: Perberos <perberos@gmail.com>
pkgname=libmatenotify
pkgver=20120517
pkgrel=1
pkgdesc="Desktop notification library"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gdk-pixbuf2')
makedepends=('git' 'gtk2' 'gobject-introspection' 'mate-common' 'gtk-doc')
groups=('mate')
options=('!emptydirs' '!libtool')
url="http://matsusoft.com.ar/projects/mate/"
source=()
sha256sums=()

_gitroot=git://github.com/mate-desktop/libmatenotify.git
_gitname=libmatenotify

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
	
    ./autogen.sh \
        --prefix=/usr \
        --disable-static || return 1
    make || return 1
}

package() {
	cd "$srcdir/$_gitname-build"
	
    make DESTDIR="${pkgdir}" install || return 1
}
