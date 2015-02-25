# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=gnome-photos
pkgname=$_pkgname-git
pkgver=3.15.90.8.g3074544
pkgrel=1
pkgdesc="Photos - access, organize and share your photos on GNOME"
arch=('i686' 'x86_64')
url="http://www.gnome.org"
license=('GPL2')
depends=('gtk3>=3.15.5' "tracker>=0.17.2" "gegl>=0.3.0" 'gnome-online-accounts' 'exempi'
	 'libexif' 'librsvg' "libgfbgraph>=0.2.1" "libgdata>=0.15.2")
makedepends=('git' 'gnome-common' 'intltool')
install=gnome-photos.install
provides=('gnome-photos=3.15.90')
conflicts=('gnome-photos')
source=('git://git.gnome.org/gnome-photos')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/gnome-photos"
  ./autogen.sh --prefix=/usr --disable-static \
	  --disable-schemas-compile \
	  --disable-Werror
  make
}

package() {
  cd "$srcdir/gnome-photos"
  make DESTDIR="$pkgdir/" install
}

