# Maintainer: Melissa Padilla <mpadilla2 at hotmail dot com>
pkgname=('python-dateutils')
pkgver=0.6.6
pkgrel=1
pkgdesc="Various utilities for working with date and datetime objects"
url="https://pypi.python.org/pypi/dateutils"
arch=('any')
license=('BSD')
depends=('python' 'python-argparse' 'python-dateutil' 'python-pytz' 'python-future')
makedepends=('python-setuptools')
provides=('dateadd' 'datediff')
conflicts=('python2-dateutils')
source=("https://pypi.python.org/packages/source/d/dateutils/dateutils-${pkgver}.tar.gz" "LICENSE.txt" 
	"python-dateutils-future.patch::https://github.com/mpadilla2/python-dateutils/commit/627fe9bbf52f8d3862098ad54828b857ec89c1c7.patch"
	"datediff.py-future.patch"
	"dateadd.py-future.patch")
md5sums=('2ba7fcac03635f1f1cad0d94d785001b'
         '81274242b57f07983b3b1ea4a9cf63df'
         '3d5d9d417c2547b53827206552a78ecd'
         '2675e0126e3b886c5774f609d1142cb3'
         '8a36a215b4c72ff9b7c04dec2171b107')
sha256sums=('c94a8e77d743abac79ed91f99f5ef594a972a527e05145cbb7aba59beced8a71'
            '034af0f12aedb47d8a201bd38ea7449dad4520a268d44266036b58e072847606'
            '7357a655e3b8041ba3b52f5b118441ef5af0bc811a42ee274074e5189c30840d'
            'f3f3920f90e7be2cb19e52d5a0fe45f2db32f1366a534d5179de23eb941c9519'
            'fe97e2bc684dc6296c368d7470ce3e7b732c6fe04a1e582db0f1523526d9360f')

prepare() {
  cd "$srcdir/dateutils-$pkgver/"
  patch -uNp1 -i ../python-dateutils-future.patch || return 1
  patch -uN dateutils/datediff.py ../datediff.py-future.patch || return 1
  patch -uN dateutils/dateadd.py ../dateadd.py-future.patch || return 1
}

build() {
  cd "$srcdir/dateutils-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/dateutils-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  install -D -m644 ../LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
