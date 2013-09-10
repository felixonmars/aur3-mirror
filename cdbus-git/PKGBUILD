# Maintainer: Thomas Gläßle <t_glaessle@gmx.de>
_pkgname=cdbus
pkgname=cdbus-git
pkgver=2013_08_07..deb50c8
pkgrel=1
pkgdesc="The C D-Bus library (CDBUS) is a simple binding (in C) to the D-Bus reference library."
arch=('any')
url="https://github.com/xs-embedded-llc/cdbus"
license=('MIT')
depends=('dbus>=1.4')
optdepends=('libev>=4.00' 'glib>=2.0')
makedepends=('cmake>=2.6' 'doxygen')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+git://github.com/xs-embedded-llc/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --format='%cd..%h' --date=short | tr - _
}

build() {
  cd "$srcdir/$_pkgname"

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" &&
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make install
}

# vim:set ts=2 sw=2 et:
