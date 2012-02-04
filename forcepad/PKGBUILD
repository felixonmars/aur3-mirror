# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=forcepad
pkgver=2.4.2
pkgrel=1
pkgdesc="ForcePAD is an intuitive tool for visualising the behavior of structures subjected to loading and boundary conditions."
arch=(i686 x86_64)
url="http://forcepad.sourceforge.net/"
license=('GPL')
depends=("fltk")
makedepends=("cmake")
source=(http://download.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('328b6589b46419fffb7fa4b247f691cf')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake . || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver/bin/release"

  mkdir -p $pkgdir/usr/bin || return 1
  cp forcepad $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:
