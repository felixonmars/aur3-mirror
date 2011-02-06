# Contributor: Marco Elver <marco.elver AT gmail.com>

pkgname=python-importlib
pkgver=1.0.1
pkgrel=1
pkgdesc="Backport of importlib module from Python 2.7 and up."
arch=('any')
url='http://pypi.python.org/pypi/importlib'
license=('BSD')
depends=('python<2.7')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/i/importlib/importlib-$pkgver.tar.gz")
options=(!emptydirs)

build() {
  cd $srcdir/importlib-$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
md5sums=('1ea851d370b029ed1bfaeb224da210fb')
