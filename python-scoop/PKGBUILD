pkgname=python-scoop
pkgver=0.7.1
pkgrel=1
pkgdesc="Scalable Concurrent Operations in Python, is a distributed task \
module allowing concurrent parallel programming on various environments, \
from heterogeneous grids to supercomputers."
arch=('any')
url="https://github.com/soravux/scoop/"
license=('LGPL')
depends=('python' 'python-setuptools' 'python-greenlet' 'python-pyzmq' 'openssh')
source=("https://pypi.python.org/packages/source/s/scoop/scoop-$pkgver.release.tar.gz")
md5sums=('56cd1e949f7677848c9fc43aeb3eb28a')

package() {
  cd "$srcdir/scoop-$pkgver.release"
  python setup.py install --root="$pkgdir/" --optimize=1
}
