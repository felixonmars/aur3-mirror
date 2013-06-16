# Maintainer: Yosef Or Boczko <yosefor3@walla.com>

_pkgname=gsettings-desktop-schemas-gnome-3-10
pkgname=$_pkgname-git
pkgver=3.9.2.5.g369b28a
pkgrel=1
_realver=3.9.2
pkgdesc="Shared GSettings schemas for the desktop"
arch=('any')
url="http://live.gnome.org/"
license=('GPL')
depends=('glib2')
makedepends=('intltool' 'gobject-introspection')
install=gsettings-desktop-schemas.install
conflicts=('gsettings-desktop-schemas')
replaces=('gsettings-desktop-schemas')
provides=('gsettings-desktop-schemas' "gsettings-desktop-schemas=$_realver" "$_pkgname=$_realver")
source=('git://git.gnome.org/gsettings-desktop-schemas')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/gsettings-desktop-schemas"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/gsettings-desktop-schemas"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/gsettings-desktop-schemas"
  make DESTDIR="$pkgdir" install
}
