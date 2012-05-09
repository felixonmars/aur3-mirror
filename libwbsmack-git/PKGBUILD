#pkgname=libwbsmack
#pkgver=0.2

pkgname=libwbsmack-git
pkgver=20120509
pkgrel=1
provides=("libwbsmack=0.2.1")
conflicts=('libwbsmack')
_gitroot='git://github.com/Blub/libwbsmack.git'
_gitname='libwbsmack'
conflicts=('smack-util')
pkgdesc="An implementation of most of libsmack with improvements and additional tools."
arch=('i686' 'x86_64')
license=('GPL') # Unfortunately forced to... otherwise I'd be using WTFPL
url="https://github.com/Blub/libwbsmack"
depends=()
source=()

install=install

build() {
	cd "$srcdir"
	msg "Connecting to GIT server..."

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

	make
}

# TODO:
#check() {
#}

package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir" install
}
