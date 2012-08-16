# Maintainer: Robert Schwarz <mail@rschwarz.net>
pkgname="python2-picos"
_pkgname="PICOS"
pkgver="0.1.0"
pkgrel=1
pkgdesc="Python interface to conic and integer programming solvers"
arch=('any')
url="http://picos.zib.de/"
license=('GPL')
depends=('python2' 'python2-numpy' 'python2-cvxopt')
optdepends=('python2-zibopt')
source=("http://picos.zib.de/dist/${_pkgname}-${pkgver}.tar.gz")
md5sums=('33fec14ce22d2fc422a6ec109f61dfd4')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 picos/test_picos.py
}
