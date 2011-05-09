# Contributor: Havanna <havanna.sha{at}gmail{dot}com>


pkgname="cliofetion-hg"
pkgver=421
pkgrel=1
pkgdesc="cliofetion is a command-line version of openfetion."

arch=("i686" "x86_64")

url="http://code.google.com/p/ofetion/"
license=("GPL")

depends=("openssl" "libxml2" "sqlite3" "libofetion-hg>=421")
makedepends=("mercurial" "pkg-config" "intltool" "cmake")

source=()
md5sums=()

_hgroot=https://ofetion.googlecode.com/hg/
_hgrepo=cliofetion

build() {
	cd "$srcdir"
	rm -rf "$srcdir/$_hgrepo-build"
	cp -rf "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
	cd "$srcdir/$_hgrepo-build/cliofetion"

	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package(){
	cd "$srcdir/$_hgrepo-build/cliofetion"
	make DESTDIR=${pkgdir} install
}
