pkgname=python-python_jwt
pkgver=1.0.0
pkgrel=1
pkgdesc="Module for generating and verifying JSON Web Tokens"
arch=('any')
url="https://pypi.python.org/pypi/python_jwt/1.0.0"
license=('MIT')
depends=('python-jws')
makedepends=('python-distribute')
source=("http://pypi.python.org/packages/source/p/python_jwt/python_jwt-$pkgver.tar.gz")
md5sums=('12a7f8b44a7345f7db6abb348f7d348a')

build() {

  cd $srcdir/python_jwt-$pkgver
  python setup.py build
}

package() {

  cd $srcdir/python_jwt-$pkgver

  python setup.py install --root="$pkgdir" --prefix="/usr"
}
# vim:set ts=2 sw=2 et:
