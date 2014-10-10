pkgname=python2-pyopt
pkgver=1.2.0
pkgrel=1
pkgdesc="package for formulating and solving nonlinear constrained optimization problems"
arch=('i686' 'x86_64')
url="http://www.pyopt.org/"
license=('LGPL')
depends=('python2-numpy')
makedepends=('swig')
source=("http://www.pyopt.org/_downloads/pyOpt-${pkgver}.tar.gz")
md5sums=('84f7574cb40919009312ad52d30109db')

build() {
  cd "$srcdir/pyOpt-$pkgver"
  python2 setup.py build
}


package() {
  cd "$srcdir/pyOpt-$pkgver"
  python2 setup.py install --root="$pkgdir"
}
