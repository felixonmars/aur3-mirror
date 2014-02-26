# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=gfbgraph
pkgver=0.2.2
_tver=${pkgver%.*}
pkgrel=1
pkgdesc="GLib/GObject wrapper for the Facebook Graph API"
arch=("i686" "x86_64")
license=("LGPLv2.1")
url="https://git.gnome.org/browse/libgfbgraph/"
depends=("glib2" "rest" "json-glib" "libsoup" "gnome-online-accounts")
makedepends=("gtk-doc" "gobject-introspection")
conflicts=(libgfbgraph)
replaces=(libgfbgraph)
provides=("gfbgraph=${_realver}")
source=("http://ftp.gnome.org/pub/GNOME/sources/$pkgname/$_tver/$pkgname-$pkgver.tar.xz")
sha256sums=('66c7b1c951863565c179d0b4b5207f27b3b36f80afed9f6a9acfc5fc3ae775d4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-static --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
