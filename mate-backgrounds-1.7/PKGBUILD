# Maintainer: Piotr Gorski
pkgname=mate-backgrounds-1.7
pkgver=1.7.1
pkgrel=1
pkgdesc="Background images and data for MATE"
arch=('any')
license=('GPL')
url="http://matsusoft.com.ar/projects/mate/"
makedepends=('git' 'intltool' 'mate-common')
conflicts=(mate-backgrounds)
replaces=(mate-backgrounds)
provides=('mate-backgrounds')
groups=('mate')
source=()
sha256sums=()

_gitroot=git://github.com/mate-desktop/mate-backgrounds.git
_gitname=mate-backgrounds

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
		--localstatedir=/var || return 1

	make || return 1
}

package() {
	cd "$srcdir/$_gitname-build"

	make DESTDIR="$pkgdir" install || return 1
}
