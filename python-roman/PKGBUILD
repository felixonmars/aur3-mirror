# AUR workaround
pkgname=python-roman
true && pkgbase=python-roman
true && pkgname=('python-roman' 'python2-roman')
pkgver=2.0.0
pkgrel=1
pkgdesc="Integer to Roman numerals converter"
url="http://pypi.python.org/pypi/roman"
makedepends=('python-setuptools')
license=('PSF')
arch=('any')
source=(http://pypi.python.org/packages/source/r/roman/roman-$pkgver.zip)
md5sums=('aa71d131eec16d45c030fd06a27c9d17')

build() {
  cd "$srcdir/roman-$pkgver"
  python setup.py build
}

package_python-roman () {
  depends=('python')

  cd $srcdir/roman-$pkgver
  python setup.py install --root="${pkgdir}"
}

package_python2-roman () {
  depends=('python2')

  cd $srcdir/roman-$pkgver
  python2 setup.py install --root="${pkgdir}"
}

