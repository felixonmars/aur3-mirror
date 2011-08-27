# Contributor: Havanna <havanna.sha{at}gmail{dot}com>


pkgname="libofetion-hg"
pkgver=421
pkgrel=1
pkgdesc="libofetion is an open source library which implements CHINA MOBILE's Fetion Protocol Version 4."

arch=("i686" "x86_64")

url="http://code.google.com/p/ofetion/"
license=("GPL")

depends=("openssl" "libxml2" "sqlite3")
makedepends=("mercurial" "pkg-config" "intltool" "cmake")

source=()
md5sums=()

_hgroot="https://ofetion.googlecode.com/hg/"
_hgrepo="ofetion"

build() {
	cd "$srcdir"
	rm -rf "$srcdir/$_hgrepo-build"
	cp -rf "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
	cd "$srcdir/$_hgrepo-build/libofetion"

	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package(){
	cd "$srcdir/$_hgrepo-build/libofetion"
	make DESTDIR=${pkgdir} install
}
