# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=gnome-taquin
pkgname=$_pkgname-git
pkgver=3.15.1.1.g8d05bdd
pkgrel=1
_realver=3.15.1
pkgdesc="Move tiles so that they reach their places."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'glib2' 'librsvg')
makedepends=('intltool' 'yelp-xsl' 'yelp-tools' 'git' 'gnome-common' 'vala')
conflicts=('gnome-games' 'gnome-taquin')
replaces=('gnome-games' 'gnome-taquin')
provides=("gnome-taquin=$_realver")
options=('!emptydirs' '!libtool')
install=gnome-taquin.install
url="https://wiki.gnome.org/ThreePointFifteen/Features/Taquin"
groups=('gnome-extra')
source=('git://git.gnome.org/gnome-taquin')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe | sed 's/^v//;s/-/./g;s/_/./g;'
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
