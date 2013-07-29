# Maintainer: Yosef Or Boczko <yoseforb@gmail.com>

_pkgname=gnome-user-docs
pkgname=$_pkgname-git
pkgver=3.8.0.198.g6de784a
pkgrel=1
pkgdesc="User documentation for GNOME"
arch=(any)
license=('FDL')
depends=('yelp')
makedepends=('yelp-tools')
url="http://www.gnome.org"
groups=('gnome')
replaces=('gnome-user-docs' 'gnome-user-docs=3.8.0')
provides=('gnome-user-docs')
conflicts=('gnome-user-docs')
source=('git://git.gnome.org/gnome-user-docs')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
