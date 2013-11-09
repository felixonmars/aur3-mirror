# Contributor: Nick Ward <ward.nickjames@gmail.com>
# Maintainer: Rich Lindsley <rich at dranek dot com>
_py_pkgname=patsy
pkgname=python2-$_py_pkgname
pkgver=0.2.1
pkgrel=1
pkgdesc="Describing statistical models in Python using symbolic formulas"
arch=('any')
url="https://github.com/pydata/patsy"
license=('BSD')
depends=('python2' 'python2-numpy')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/$_py_pkgname/$_py_pkgname-${pkgver}.tar.gz")
md5sums=('ea36c846d62231e41df684a827a5fd58')
sha1sums=('6e5049fe15713d3e5c8488c5380ea1724a1b37d0')
sha256sums=('31374ce25275813d8f1c48bdda40bba06f7a16cce7dcdfad73f43a555393d065')

package() {
  cd "$srcdir/$_py_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
