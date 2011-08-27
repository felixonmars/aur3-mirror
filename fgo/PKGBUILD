# Maintainer: Raphael Dümig <raphael[AT]duemig-neufahrn[DOT]de>
pkgname=fgo
pkgver=1.3.1
pkgrel=4
pkgdesc="FGo! is a fast and simple GUI-launcher for FlightGear flight simulator, written in python"
arch=('any')
url="http://sites.google.com/site/erobosprojects/flightgear/add-ons/fgo"
license=('GPL')
depends=('python2' 'python-imaging' 'tcl' 'tk')
makedepends=()
source=($pkgname-$pkgver.tar.gz)
md5sums=('21117e05897cfd0b218c37259b0d2ee7')

build() {
  echo "ready for installing"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  cp -r usr/ $pkgdir/
}

# vim:set ts=2 sw=2 et:
