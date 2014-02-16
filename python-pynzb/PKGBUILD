# AUR workaround
pkgname=python-pynzb
true && pkgbase=python-pynzb
true && pkgname=('python-pynzb' 'python2-pynzb')

pkgver=0.1.0
pkgrel=3
pkgdesc="A unified API for parsing NZB files"
arch=('any')
url="http://pypi.python.org/pypi/pynzb/"
license=('BSD')
makedepends=('python-setuptools')
optdepends=('python-lxml: Use lxml instead of expat')
source=(http://pypi.python.org/packages/source/p/pynzb/pynzb-$pkgver.tar.gz)
md5sums=('63c74a36348ac28aa99732dcb8be8c59')

build() {
  cd $srcdir/pynzb-$pkgver

  python setup.py build
}

package_python-pynzb () {
  depends=('python')

  cd $srcdir/pynzb-$pkgver
  python setup.py install --root="${pkgdir}"
}

package_python2-pynzb () {
  depends=('python2')

  cd $srcdir/pynzb-$pkgver
  python2 setup.py install --root="${pkgdir}"
}

