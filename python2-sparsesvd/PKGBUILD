# Maintainer: Rich Li <rich at dranek dot com>
pkgname=python2-sparsesvd
_py_pkgname=sparsesvd # The pypi package name
pkgver=0.2.2
pkgrel=1
pkgdesc="Python module that wraps SVDLIBC, a library for sparse Singular Value Decomposition"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/sparsesvd/"
license=('BSD')
depends=('python2-numpy' 'python2-scipy')
makedepends=('cython2')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/s/$_py_pkgname/$_py_pkgname-$pkgver.tar.gz)
md5sums=('9aa2da546bfe7fa72e7565632de530ad')
sha1sums=('f43186cbe4bc49492b551ca9ea0b78742a6aa152')
sha256sums=('3f775ac22a35764dad97c0d83b2cb47caa46fd11d0f6a9eb1883a0e07dd88df8')

# If you follow the sparsesvd documentation for the installation process, there's some seemingly redundant compilation when "setup.py install" runs after "setup.py test". So I instead move the (double?) compilation to build() so that check() and package() don't do any building.

check() {
  cd "$srcdir/$_py_pkgname-$pkgver"
  python2 setup.py test
}

build() {
  cd "$srcdir/$_py_pkgname-$pkgver"
  python2 setup.py build_ext --inplace # only needed for check()
  python2 setup.py build
}

package() {
  cd "$srcdir/$_py_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
