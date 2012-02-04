# Maintainer: Paul Colomiets <pc@gafol.net>
pkgname=runsnake
pkgver=2.0.0b7
pkgrel=1
pkgdesc="GUI Viewer for Python profiling runs"
arch=('any')
url="http://www.vrplumber.com/programming/runsnakerun/"
license=('GPL')
depends=('python2-squaremap')
source=('http://pypi.python.org/packages/source/R/RunSnakeRun/RunSnakeRun-2.0.0b7.tar.gz')
md5sums=('146f647a48e05a1bf1ced45fa593f844')

package() {
  cd "$srcdir/RunSnakeRun-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:
