# Maintainer: Piotr Gorski <prgorski88@gmail.com>


pkgname=mate-terminal-1.7
pkgver=1.7.1
pkgrel=1
pkgdesc="The MATE Terminal Emulator"
arch=('i686' 'x86_64')
license=('GPL')
depends=('vte' 'libsm')
makedepends=('git' 'pkgconfig' 'mate-doc-utils' 'intltool' 'yelp-tools')
options=('!emptydirs' '!libtool')
conflicts=(mate-terminal)
replaces=(mate-terminal)
install=mate-terminal.install
url="https://github.com/mate-desktop/mate-terminal"
groups=('mate-extras')
source=()
sha256sums=()

_gitroot=git://github.com/mate-desktop/mate-terminal.git
_gitname=mate-terminal

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

	./autogen.sh --prefix=/usr --sysconfdir=/etc --disable-static \
		--localstatedir=/var --disable-scrollkeeper --with-gnu-ld || return 1
	make || return 1
}

package() {
	cd "$srcdir/$_gitname-build"

	make MATECONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1

	install -m755 -d "${pkgdir}/usr/share/mateconf/schemas"

	rm -f ${pkgdir}/etc/mateconf/schemas/*.schemas
}

