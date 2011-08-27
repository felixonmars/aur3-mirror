# Maintainer: Byron Clark <byron@theclarkfamily.name>
pkgname=python-xrandr
pkgver=0.1
pkgrel=2
pkgdesc="Python API for the RandR X.org extension"
arch=('any')
url="https://launchpad.net/python-xrandr"
license=('GPL')
depends=('python2')
source=(http://launchpad.net/$pkgname/stable/0.1/+download/$pkgname-$pkgver.tar.gz)
md5sums=('bcfc2ca0112fd6680a28d27760bd6561')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir --optimize=1
}

# vim:set ts=2 sw=2 et:
