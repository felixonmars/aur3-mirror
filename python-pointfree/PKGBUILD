# Contributor: Vincent Berset <msieurhappy@gmail.com>

pkgname=python-pointfree
pkgver=1.0.0
pkgrel=1
pkgdesc="Pointfree style toolkit for Python"
arch=('any')
url="https://pypi.python.org/pypi/pointfree/"
license=('Apache')
depends=('python')
source=("http://pypi.python.org/packages/source/p/pointfree/pointfree-${pkgver}.tar.gz")
md5sums=('79f48e0b5a4740c487ff0a59d5d3483a')

build() {
  cd $srcdir/pointfree-${pkgver}
  python ./setup.py install --root=$pkgdir
}
