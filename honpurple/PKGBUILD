# Maintainer: Thomas Weißschuh <thomas_weissschuh || lavabit || com>
# Contributor: Andrei Thorp <garoth at the lovely gmail dot com>

pkgname=honpurple
pkgver=0.5.11.1
pkgrel=1
pkgdesc="libpurple plugin for the Heroes of Newerth chat server."
arch=('i686' 'x86_64')
url="http://code.google.com/p/honpurple"
license=('GPL3')
depends=("libpurple")
source=( "http://honpurple.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2" )

build() {
  cd "${srcdir}"
  make
}

package() {
  cd "${srcdir}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
sha1sums=('d49d3e9ed356cc34d2c0628eef62cfdf55a42f19')
