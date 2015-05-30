# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=gjs
pkgname=$_pkgname-git
pkgver=1.43.3.r13.g31a1e86
_realver=1.43.3
pkgrel=1
pkgdesc="Javascript Bindings for GNOME"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Gjs"
license=('GPL')
depends=('cairo' 'dbus-glib' "gobject-introspection" "js")
options=('!libtool')
replaces=('gjs')
provides=("gjs=${_realver}")
conflicts=('gjs')
source=('git://git.gnome.org/gjs')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed -E 's/^GJS_//;s/_/./g;s/([^-]*-g)/r\1/;s|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --disable-static
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
