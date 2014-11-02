# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>
pkgname=python-path.py
url="https://pypi.python.org/pypi/path.py"
pkgver=7.0
pkgrel=1
pkgdesc="path.py implements a path objects as first-class entities, allowing common operations on files to be invoked on those path objects directly"
arch=('any')
license=('MIT')
depends=(python python-distribute)
source=(https://github.com/jaraco/path.py/archive/$pkgver.tar.gz)
md5sums=('747835e9abb8c184ad431e0fe18c9b4f')

package()
{
  cd "$srcdir/path.py-$pkgver/"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
}
