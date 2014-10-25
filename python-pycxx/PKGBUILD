# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Sebastien Binet <binet@cern.ch>

pkgbase=python-pycxx
pkgname=('python-pycxx' 'python2-pycxx')
pkgver=6.2.5
pkgrel=1
pkgdesc="set of classes to help create extensions of Python in the C++ language"
url="http://cxx.sourceforge.net/"
license="BSD"
arch=("i686" "x86_64")
makedepends=(python python2)
source=(http://downloads.sourceforge.net/project/cxx/CXX/PyCXX%20V$pkgver/pycxx-$pkgver.tar.gz)
md5sums=('c2901863c422417ad6a6e9d3abf65ece')


prepare() {
  cp -r $srcdir/${pkgname/python-/}-$pkgver $srcdir/${pkgname/python-/}-$pkgver-py2
}

build() {
  cd $srcdir/${pkgname/python-/}-$pkgver
  python setup.py build

  cd $srcdir/${pkgname/python-/}-$pkgver-py2
  python2 setup.py build

}

package_python-pycxx() {
  pkgdesc+=" (Python3.x)"
  depends=('python')

  cd $srcdir/${pkgname/python-/}-$pkgver
  python setup.py install --prefix=/usr --root=$pkgdir
}

package_python2-pycxx() {
  pkgdesc+=" (Python2.x)"
  depends=('python2')

  cd $srcdir/${pkgname/python-/}-$pkgver-py2
  python2 setup.py install --prefix=/usr --root=$pkgdir
}
