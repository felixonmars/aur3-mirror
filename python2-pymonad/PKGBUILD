# Maintainer: Anthony Caccia <acaccia at ulb dot ac dot be>

pkgname=python2-pymonad
pkgver=1.3
pkgrel=1
pkgdesc="Collection of classes for programming with functors, applicative functors and monads"
url="https://pypi.python.org/pypi/PyMonad/"
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/P/PyMonad/PyMonad-$pkgver.tar.gz")
md5sums=('edf3e8b4d54760c41c9a6ab22759e625')

build() {
  cd "$srcdir/PyMonad-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/PyMonad-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
