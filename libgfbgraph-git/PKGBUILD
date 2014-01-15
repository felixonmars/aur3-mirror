# Maintainer: Yosef Or Boczko <yoseforb@gmail.com>

_pkgname=libgfbgraph
pkgname=$_pkgname-git
pkgver=V_0_2_2.3.g5f24a45
pkgrel=1
_realver=0.2.3
pkgdesc="GLib/GObject wrapper for the Facebook Graph API"
arch=("i686" "x86_64")
license=("LGPLv2.1")
url="https://git.gnome.org/browse/libgfbgraph/"
depends=("glib2" "rest" "json-glib" "libsoup" "gnome-online-accounts")
makedepends=("gtk-doc" "gobject-introspection")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
provides=("${_pkgname}=${_realver}")
source=("git://git.gnome.org/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --disable-static --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
