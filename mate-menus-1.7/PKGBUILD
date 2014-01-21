# Maintainer: Piotr Gorski <sir_lucjan@bridgelinux.pl>

pkgname=mate-menus-1.7
pkgver=1.7.1
pkgrel=1
pkgdesc="MATE menu specifications"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glib2' 'python2')
makedepends=('intltool' 'gobject-introspection')
options=('!emptydirs' '!libtool')
conflicts=(mate-menus)
replaces=(mate-menus)
provides=(mate-menus)
source=()
sha256sums=()
url="http://git.mate-desktop.org/"
groups=('mate')

_gitroot=git://github.com/mate-desktop/mate-menus.git
_gitname=mate-menus

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

    PYTHON=/usr/bin/python2 ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var  \
        --enable-python \
        --disable-static || return 1
    make || return 1
}

package() {
	cd "$srcdir/$_gitname-build"
    make DESTDIR="${pkgdir}" install || return 1
}



