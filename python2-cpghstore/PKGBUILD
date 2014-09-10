# Maintainer: Adam Wolk <netprobe at gmail dot com>
_name=cpghstore
pkgname=python2-${_name}
pkgver=0.1
pkgrel=1
pkgdesc="Fast postgres hstore parser."
arch=('any')
url="https://github.com/kajic/cpghstore"
license=('MIT')
makedepends=('python2-setuptools')
depends=('python2')
source=("https://pypi.python.org/packages/source/c/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('6ac36c09367be3738c671298d3f33220')

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
