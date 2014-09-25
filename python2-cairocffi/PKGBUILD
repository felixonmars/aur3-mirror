# Maintainer: Marti Raudsepp <marti@juffo.org>
_pypi_name='cairocffi'
pkgver=0.6
pkgrel=1
pkgdesc="CFFI-based drop-in replacement for Pycairo"
license=('BSD')
arch=('any')
url="http://pythonhosted.org/cairocffi/"
makedepends=('python2')
depends=()
pkgname="python2-cairocffi"
_pypi_name_inital=$(echo ${_pypi_name}|cut -c1)
source=("https://pypi.python.org/packages/source/${_pypi_name_inital}/${_pypi_name}/${_pypi_name}-${pkgver}.tar.gz")

package() {
  cd "$srcdir/$_pypi_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('af0e93b31be42a8f2be23b1234336496')
