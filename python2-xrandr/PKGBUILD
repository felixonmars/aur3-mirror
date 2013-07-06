# Maintainer: tychoish  <tychoish@cyborginstitute.net>
_pkgname=python-xrandr
pkgname=python2-xrandr
pkgver=0.1
pkgrel=3
pkgdesc="Python API for the RandR X.org extension"
arch=('any')
url="https://launchpad.net/python-xrandr"
license=('GPL')
depends=('python2')
source=(http://launchpad.net/$_pkgname/stable/0.1/+download/$_pkgname-$pkgver.tar.gz)
md5sums=('bcfc2ca0112fd6680a28d27760bd6561')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir --optimize=1
}
