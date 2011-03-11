# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>

pkgname=python2-inject
pkgver=1.0.1
pkgrel=1
pkgdesc="Fast python dependency injection framework"
arch=('any')
license=('MIT')
url="http://code.google.com/p/python-inject/"
depends=('python2')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/I/Inject/Inject-$pkgver.tar.gz)
md5sums=('c1d8cc4b0a8992e54cac20213d5f76a0')

build() {
  cd "$srcdir/Inject-$pkgver"
  python2 setup.py install --root="${pkgdir}" --optimize=1 || return 1
}
