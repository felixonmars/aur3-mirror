# Contributor: Havanna <havanna.sha{at}gmail{dot}com>


pkgname="fetion-pidgin"
pkgver=20
pkgrel=1
pkgdesc="Fetion plugin for pidgin"

arch=("i686" "x86_64")

url="http://code.google.com/p/ofetion/"
license=("GPL")

depends=("openssl" "libxml2" "gtk2" "sqlite3" "librsvg")
makedepends=("mercurial" "pkg-config" "intltool" "cmake")
optdepends=("libnotify" "gstreamer0.10" "networkmanager" "libxss" "pidgin")

source=()
md5sums=()

_hgroot=https://fetion-pidgin.ofetion.googlecode.com/hg/
_hgrepo=fetion-pidgin

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
# vim:syntax=sh
