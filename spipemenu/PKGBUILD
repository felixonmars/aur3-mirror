#Author/maintainer : ahmet emre <aecepoglu at gmail>

pkgname="spipemenu"
pkgrel=1
pkgver=1.2
pkgdesc="A simple and ugly full-screen menu/launcher"
url="http://bitbucket.org/aecepoglu/spipemenu"
license=('GPL')
arch=("i686" "x86_64")
depends=("libxcb" "xcb-util-wm" "xcb-util-keysyms" "libcsv")
provides=("spipemenu")
makedepends=("git")
_gitroot="https://bitbucket.org/aecepoglu"
_gitrepo="spipemenu"
source=("git+$_gitroot/$_gitrepo")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_gitrepo}"
	git describe --abbrev=0
}

build() {
	cd $srcdir/${_gitrepo}
	make
}

package() {
	mkdir -p $pkgdir/usr/bin
	cd $srcdir/${_gitrepo}
	make DESTDIR="$pkgdir/usr/bin" install
}
