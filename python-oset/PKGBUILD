# Maintainer: Dennis Fink <the_metalgamer@hackerspace.lu>

pkgname='python-oset'
pkgver=0.1.3
pkgrel=1
pkgdesc="Ordered Set"
arch=('any')
url="https://pypi.python.org/pypi/oset/"
license=('MIT')
depends=('python')
makedepends=('python-distribute')
source=("http://pypi.python.org/packages/source/o/oset/oset-${pkgver}.tar.gz")
md5sums=('f23e5a545d2c77df3916398d2d39a3ab')

build() {
  cd "$srcdir/oset-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/oset-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "$srcdir/oset-$pkgver/LICENSE.rst" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
