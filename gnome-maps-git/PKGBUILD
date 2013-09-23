# Contributor: Yosef Or Boczko <yoseforb@gmail.com>

_pkgname=gnome-maps
pkgname=$_pkgname-git
pkgver=3.9.91.68.g5397f07
pkgrel=1
pkgdesc="A simple GNOME 3 maps application"
arch=(i686 x86_64)
license=('GPL')
url="https://git.gnome.org/browse/gnome-maps/"
depends=('geocode-glib-git' "geoclue2" 'glib2' 'gjs' 'gtk3' 'gnome-desktop' 'libchamplain' 'gnome-themes-standard' 'gnome-icon-theme-symbolic')
makedepends=('git' 'gobject-introspection' 'intltool' 'gnome-common')
options=('!libtool' '!emptydirs')
install=$_pkgname.install
conflicts=('gnome-maps')
replaces=('gnome-maps')
provides=('gnome-maps' "gnome-maps=3.9.91")
source=('git://git.gnome.org/gnome-maps')

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
