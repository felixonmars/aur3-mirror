# Maintainer: David Birch <dsjbirch@gmail.com>
# Contributor: Kristian Setälä<kristian.setala@gmail.com>

pkgname=xkblayout-state
pkgver=1b
pkgrel=3
pkgdesc="A small command-line program to get/set the current XKB layout"
arch=(i686 x86_64)
url="https://github.com/bluekeys/xkblayout-state"
license=('GPL')
depends=(gcc-libs libx11)
source=(https://github.com/bluekeys/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('e34a90ce1effd9957d035867f44e2634')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make
  install -D xkblayout-state "$pkgdir/usr/bin/xkblayout-state"
}

# vim:set ts=2 sw=2 et:
