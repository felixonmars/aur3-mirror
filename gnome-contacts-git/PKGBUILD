# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=gnome-contacts
pkgname=$_pkgname-git
pkgver=3.16.1.17.g02a2777
_realver=3.16.1
pkgrel=1
pkgdesc="Contacts Manager for GNOME"
arch=(i686 x86_64)
url="http://www.gnome.org"
license=('GPL2')
groups=('gnome-extra')
depends=('gtk3' "folks>=0.9.5" 'libnotify' 'gnome-desktop' 'dconf' 'gnome-online-accounts'
         'libgee' 'telepathy-glib' 'cheese' 'glib2' "evolution-data-server" "libchamplain"
         "clutter-gtk" "geocode-glib")
makedepends=('intltool' 'vala' 'gobject-introspection')
install=$_pkgname.install
replaces=('gnome-contacts')
provides=('gnome-contacts=3.16.0')
conflicts=('gnome-contacts')
source=('git://git.gnome.org/gnome-contacts')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --libexecdir=/usr/lib/gnome-contacts --disable-static
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
