# Contributor: Rémy Oudompheng <remy@archlinux.org>

pkgname=python-zodb3
_pypi=ZODB3
pkgver=3.9.7
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Zope Object Database module for Python"
license=("ZPL")
url=http://pypi.python.org/pypi/ZODB3
depends=('python2' 'python-transaction' 'python-zc.lockfile' 'zope-interface' 'zope-proxy')
makedepends=('setuptools')
source=(http://pypi.python.org/packages/source/Z/ZODB3/$_pypi-$pkgver.tar.gz)
md5sums=('c4202392af6d45fe899ec7da31a7ead4')

build() {
  cd $srcdir/$_pypi-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pypi-$pkgver
  python2 setup.py install --root=$pkgdir
}
