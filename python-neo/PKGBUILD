# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Nick Ward <ward.nickjames@gmail.com>

pkgbase=python-neo
pkgname=('python-neo' 'python2-neo')
pkgver=0.3.3
pkgrel=1
pkgdesc="represent electrophysiology data in Python, together with support for reading a wide range of neurophysiology file formats"
arch=('any')
url="http://neuralensemble.org/neo/"
license=('BSD')
makedepends=('python' 'python-quantities>=0.9.0' 'python-numpy>=1.5.0')
makedepends+=('python2' 'python2-quantities>=0.9.0' 'python2-numpy>=1.5.0')
source=("https://pypi.python.org/packages/source/n/neo/neo-${pkgver}.tar.gz")
md5sums=('98e7e8948158f4492fc94d9d44367c91')


package_python-neo() {
  pkgdesc+=" (Python3.x)"
  depends=('python' 'python-quantities>=0.9.0' 'python-numpy>=1.5.0')
  cd "$srcdir/neo-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-neo() {
  pkgdesc+=" (Python2.x)"
  depends=('python2' 'python2-quantities>=0.9.0' 'python2-numpy>=1.5.0')
  cd "$srcdir/neo-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
