# Maintainer: Brett Nelson <brettnelson at ufl dot edu>

pkgname=python-mahotas
pkgver=1.2.3
pkgrel=1
pkgdesc='A set of functions for image processing in Python'
arch=('any')
url='http://luispedro.org/software/mahotas'
license=('GPL')
depends=('python-numpy')
makedepends=('python-distribute')
optdepends=('python-scipy' 'python-matplotlib' 'freeimage')
source=("http://pypi.python.org/packages/source/m/mahotas/mahotas-$pkgver.tar.gz")
md5sums=('0fe9415320d8c3e4c301a93e1d315239')

build() {
  cd "$srcdir/mahotas-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/mahotas-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
