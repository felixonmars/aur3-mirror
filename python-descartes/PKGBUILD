# $Id$
# Maintainer: Brett L Kleinschmidt <blk@blk.me>
# Contributor: Brett L Kleinschmidt <blk@blk.me>

pkgbase=python-descartes
pkgname=('python-descartes' 'python2-descartes')
pkgver=1.0.1
pkgrel=1
pkgdesc="Use geometric objects as matplotlib paths and patches"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/descartes"
license=('BSD')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=(https://pypi.python.org/packages/source/d/descartes/descartes-${pkgver}.tar.gz)
md5sums=('fcacfa88674032891666d833bdab9b6d')

prepare() {
  cp -a "descartes-$pkgver"{,-py2}
}

build() {
  cd "descartes-$pkgver"
  python setup.py build

  cd "../descartes-$pkgver-py2"
  python2 setup.py build
}

package_python-descartes() {
  depends=('python' 'python-numpy' 'python-matplotlib')
  optdepends=('python-shapely>=1.2: shapely object support')

  cd "descartes-$pkgver"
  python setup.py install --root="$pkgdir" -O1
}

package_python2-descartes() {
  depends=('python2' 'python2-numpy' 'python2-matplotlib')
  optdepends=('python2-shapely>=1.2: shapely object support')

  cd "descartes-$pkgver-py2"
  python2 setup.py install --root="$pkgdir" -O1
}

# vim:set ts=2 sw=2 et:
