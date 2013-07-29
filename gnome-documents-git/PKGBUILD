# Maintainer: Yosef Or Boczko <yoseforb@gmail.com>

_pkgname=gnome-documents
pkgname=$_pkgname-git
pkgver=3.9.4.4.ge092318
_realver=3.9.4
pkgrel=1
pkgdesc="Documents Manager for GNOME"
arch=(i686 x86_64)
url="http://www.gnome.org"
license=(GPL)
groups=('gnome-extra')
depends=('evince' 'gjs' "gtk3>=3.9.1" 'gnome-desktop' 'gnome-online-accounts' 'libgdata'
         'tracker' 'libzapojit' 'webkitgtk3')
makedepends=('git' 'intltool' 'gobject-introspection' 'itstool' 'docbook-xsl')
optdepends=('unoconv: Support for Libreoffice document types')
options=('!libtool')
conflicts=('gnome-documents')
replaces=('gnome-documents')
provides=('gnome-documents' "gnome-documents=$_realver")
install=gnome-documents.install
url="http://www.gnome.org"
source=('git://git.gnome.org/gnome-documents')
sha256sums=('SKIP ')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/$_pkgname
  make
}


check() {
  cd "$srcdir/$_pkgname"
  make check
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
