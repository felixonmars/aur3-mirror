# Contributor: Christian Thurau <christian DOT thurau AT iais DOT fraunhofer DOT de>
# Contributor: Nils Werner <nils DOT werner AT gmail DOT com>
pkgname='python2-pymf'
pkgver=0.1.9
pkgrel=2
pkgdesc="Python Matrix Factorization (PyMF) is a module for several constrained/unconstrained matrix factorization (and related) methods"
url="http://code.google.com/p/pymf/"
arch=('any')
license=('GPL3')
depends=('python2' 'python2-cvxopt')
source=(https://pypi.python.org/packages/source/P/PyMF/PyMF-$pkgver.tar.gz pymf-$pkgver.patch)
md5sums=('98b50af2dc12aab62976416cf4185c2b' '0f4b9148aa1daddfca6d055e1a59fd22')

build() {
    cd "$srcdir/PyMF-$pkgver/"
    patch -p1 -i $srcdir/pymf-$pkgver.patch
    python2 setup.py build || return 1
}
 
package() {
    cd "$srcdir/PyMF-$pkgver/"
    python2 setup.py install --root=$pkgdir || return 1 
}
