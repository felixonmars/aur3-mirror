# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=gnome-color-manager
pkgname=$_pkgname-git
pkgver=3.16.0.r9.ge58016e
_realver=3.17.1
pkgrel=1
pkgdesc="Color profile manager for the GNOME desktop"
arch=(i686 x86_64)
url="http://projects.gnome.org/gnome-color-manager/"
license=(GPL2)
depends=('libcanberra' 'vte3' 'exiv2' 'hicolor-icon-theme' 'desktop-file-utils' 'clutter-gtk'
         'mash' 'shared-color-targets' 'gnome-desktop' 'colord-gtk' 'libexif' 'glib2' 'gtk3' 'lcms2')
makedepends=('intltool' 'yelp-tools' 'git' 'appstream-glib')
install=gnome-color-manager.install
options=('!libtool' '!emptydirs')
groups=('gnome-extra')
replaces=('gnome-color-manager')
provides=("gnome-color-manager=${_realver}")
conflicts=('gnome-color-manager')
source=('git://git.gnome.org/gnome-color-manager')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed -E 's/^GNOME_COLOR_MANAGER_//;s/_/./g;s/([^-]*-g)/r\1/;s|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh  --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/gnome-color-manager --disable-static --disable-man-pages
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
