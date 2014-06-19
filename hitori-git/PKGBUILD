# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=hitori
pkgname=$_pkgname-git
pkgver=0.4.3.r19.g1e6a53c
pkgrel=1
_realver=0.4.3
pkgdesc="GTK+ application to generate and let you play games of Hitori"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Hitori"
license=('GPL')
depends=('gtk3')
makedepends=('intltool' 'itstool' 'git')
install=$_pkgname.install
conflicts=('hitori')
replaces=('hitori')
provides=('hitori' "hitori=$_realver")
source=('git://git.gnome.org/hitori')
sha256sums=('SKIP ')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed -E 's/^HITORI_//;s/_/./g;s/([^-]*-g)/r\1/;s|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}