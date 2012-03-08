# Maintainer: Perberos <perberos@gmail.com>
pkgname=libmateui
pkgver=20120308
pkgrel=1
pkgdesc="User Interface library for MATE"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libmatecomponentui' 'libmatekeyring' 'libsm')
makedepends=('intltool' 'pkgconfig')
groups=('mate')
options=('!emptydirs' '!libtool')
url="http://matsusoft.com.ar/projects/mate/"
source=()
sha256sums=()

_gitroot=git://github.com/mate-desktop/libmateui.git
_gitname=libmateui

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
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-static \
        --libexecdir=/usr/lib/libmateui || return 1
    # --with-gtk=3.0

    make || return 1
}

package() {
	cd "$srcdir/$_gitname-build"

    make DESTDIR="$pkgdir" install || return 1
}
