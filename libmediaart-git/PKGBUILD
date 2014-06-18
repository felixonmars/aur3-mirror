# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=libmediaart
pkgname=$_pkgname-git
pkgver=0.4.0.2.gf68fee1
pkgrel=1
pkgdesc="Library for handling media art"
arch=(i686 x86_64)
license=('GPL')
url="http://live.gnome.org/devhelp/"
depends=('glib2' 'gdk-pixbuf2' "gtk3" "glib2")
makedepends=('gtk-doc' 'vala')
options=('!libtool' '!emptydirs')
conflicts=('libmediaart')
replaces=('libmediaart')
provides=('libmediaart=0.4.0')
source=('git://git.gnome.org/libmediaart')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --disable-qt --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
