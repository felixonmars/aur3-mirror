# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=gnome-system-log
pkgname=$_pkgname-git
pkgver=3.9.90.94.g6f93315
pkgrel=1
pkgdesc="View your system logs"
arch=(i686 x86_64)
url="http://gnome.org"
license=('GPL2')
depends=('dconf' "gtk3>=3.13.4")
makedepends=('intltool' 'itstool' 'docbook-xsl' 'yelp-tools')
groups=('gnome')
install=$_pkgname.install
conflicts=('gnome-system-log')
replaces=('gnome-system-log')
provides=('gnome-system-log=3.13.3')
source=(git://git.gnome.org/gnome-system-log)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr \
    --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
