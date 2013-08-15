# Maintainer: Robert Schwarz <mail@rschwarz.net>
pkgname="python2-picos"
_pkgname="PICOS"
pkgver="1.0.0"
pkgrel=1
pkgdesc="Python interface to conic and integer programming solvers"
arch=('any')
url="http://picos.zib.de/"
license=('GPL')
depends=('python2' 'python2-numpy' 'python2-cvxopt')
optdepends=('python2-zibopt')
source=("http://picos.zib.de/v100/dist/${_pkgname}-${pkgver}.tar.gz")
md5sums=('703767e2ca81c351849b9678255f3b72')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --prefix="$pkgdir/"
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  PYTHONPATH=$srcdir/$_pkgname-$pkgver:$PYTHONPATH python2 picos/test_picos.py
}
