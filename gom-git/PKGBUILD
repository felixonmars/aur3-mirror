# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=gom
pkgname=$_pkgname-git
pkgver=fce1242
_realver=0.1.90
pkgrel=1
pkgdesc="A GObject to SQLite object mapper."
arch=(i686 x86_64)
url="https://wiki.gnome.org/Projects/Gom/"
license=(LGPLv3)
depends=('glib2' 'sqlite' 'gdk-pixbuf2')
makedepends=('intltool' 'git' 'gtk-doc' 'gnome-common')
options=('!libtool')
replaces=('gom')
provides=('gom' gom=$_realver)
conflicts=('gom')
source=('git://git.gnome.org/gom')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --disable-static --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
