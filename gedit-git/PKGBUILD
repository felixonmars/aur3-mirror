# Contributor: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=gedit
pkgname=$_pkgname-git
pkgver=3.17.0.37.g04223cb
_realver=3.17.0
pkgrel=1
pkgdesc="A text editor for GNOME"
arch=('i686' 'x86_64')
license=('GPL')
depends=("glib2" "gtk3" "gtksourceview3>=3.17.2" 'gsettings-desktop-schemas' 'libxml2'
         'libpeas' 'enchant' 'iso-codes' 'libsm' 'desktop-file-utils' 'python-gobject' 'dconf')
makedepends=('yelp-tools' 'intltool' 'libzeitgeist' 'gtk-doc' "vala>=0.25.1")
optdepends=('libzeitgeist: Zeitgeist plugin')
groups=('gnome-extra')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
source=('git://git.gnome.org/gedit')
sha256sums=('SKIP')
install=$_pkgname.install
replaces=('gedit')
provides=("gedit=${_realver}")
conflicts=('gedit')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  git clone git://git.gnome.org/libgd
  ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --disable-updater --disable-schemas-compile \
	  --disable-maintainer-mode --disable-deprecations \
	  --enable-python --enable-gtk-doc
  make
}

package(){
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
