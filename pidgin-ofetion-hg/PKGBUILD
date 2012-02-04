# Contributor: Havanna <havanna.sha{at}gmail{dot}com>


pkgname="pidgin-ofetion-hg"
pkgver=21
pkgrel=1
pkgdesc="Fetion plugin for pidgin"

arch=("i686" "x86_64")

url="http://code.google.com/p/ofetion/"
license=("GPL")

depends=("openssl" "libxml2" "gtk2" "sqlite3" "librsvg" "pidgin")
makedepends=("mercurial" "pkg-config" "intltool" "cmake")
optdepends=("libnotify" "gstreamer0.10" "networkmanager" "libxss")

source=()
md5sums=()

_hgroot=http://fetion-pidgin.ofetion.googlecode.com/hg/
_hgrepo=pidgin-ofetion

build() {
  cd "$srcdir"
  rm -rf "$srcdir/$_hgrepo-build"
  cp -rf "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package(){
  cd "$srcdir/$_hgrepo-build"
  make DESTDIR=${pkgdir} install
}
