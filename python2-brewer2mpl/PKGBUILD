# Maintainer:  Kyle Meyer <kyle@kyleam.com>

pkgname=python2-brewer2mpl
_libname=${pkgname/python2-/}
pkgver=1.4.1
pkgrel=1
pkgdesc='Connect colorbrewer2.org color maps to Python and matplotlib'
arch=('any')
url='https://github.com/jiffyclub/brewer2mpl/wiki'
license=('MIT')
source=("https://pypi.python.org/packages/source/b/brewer2mpl/brewer2mpl-$pkgver.tar.gz")
md5sums=('f8cd1fbb9f5d836a3a095b1ca9d58fc2')

build() {
  cd "$srcdir/$_libname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_libname-$pkgver"
  python2 setup.py install --skip-build -O1 --root="$pkgdir"
}
