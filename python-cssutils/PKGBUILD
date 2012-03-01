# Maintainer: Simon Sapin <simon dot sapin at exyr dot org>
pkgname='python-cssutils'
pkgver=0.9.9
pkgrel=1
pkgdesc="A CSS Cascading Style Sheets library for Python (Python 3 package)"
arch=('any')
url="http://pypi.python.org/pypi/cssutils/"
license=('LGPL')
source=("http://pypi.python.org/packages/source/c/cssutils/cssutils-${pkgver}.zip")
makedepends=('python')
depends=('python')
md5sums=('5f8ea824cc0e0518b574da20e895be08')


package() {
  cd "$srcdir/cssutils-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
  rm -rf "$pkgdir/usr/bin"  # Avoid a conflict: only keep the Py2 executables.
}
