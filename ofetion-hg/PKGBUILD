# Contributor: Havanna <havanna.sha{at}gmail{dot}com>


pkgname="ofetion-hg"
pkgver=421
pkgrel=1
pkgdesc="OpenFetion a IM client based on GTK+2.0, using CHINA MOBILE's Fetion Protocol Version 4."

arch=("i686" "x86_64")

url="http://code.google.com/p/ofetion/"
license=("GPL")

depends=("openssl" "libxml2" "gtk2" "sqlite3" "librsvg" "libofetion-hg>=421")
makedepends=("mercurial" "pkg-config" "intltool" "cmake")
optdepends=("libnotify" "gstreamer0.10" "networkmanager" "libxss")

source=()
md5sums=()

_hgroot=https://ofetion.googlecode.com/hg/
_hgrepo=ofetion

build() {
	cd "$srcdir"
	rm -rf "$srcdir/$_hgrepo-build"
	cp -rf "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
	cd "$srcdir/$_hgrepo-build/openfetion"

	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package(){
	cd "$srcdir/$_hgrepo-build/openfetion"
	make DESTDIR=${pkgdir} install
}
