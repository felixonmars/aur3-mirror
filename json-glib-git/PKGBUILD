# Maintainer: Yosef Or Boczko <yoseforb@gmail.com>

_pkgname=json-glib
pkgname=$_pkgname-git
pkgver=0.16.0.15.g3fd4735
pkgrel=1
pkgdesc="JSON library built on GLib"
arch=('i686' 'x86_64')
url="http://live.gnome.org/JsonGlib"
license=('GPL')
depends=('glib2')
makedepends=('gobject-introspection' 'gtk-doc' 'git')
options=('!libtool')
conflicts=('json-glib')
replaces=('json-glib')
provides=('json-glib' 'json-glib=0.16.1')
source=('git://git.gnome.org/json-glib')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --enable-gtk-doc
  make
}

package(){
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
