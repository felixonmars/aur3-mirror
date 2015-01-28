# Maintainer: Melissa Padilla <mpadilla2 at hotmail dot com>
pkgname=('python-socketpool')
pkgver=0.5.3
pkgrel=1
pkgdesc="A simple python socket pool"
url="https://pypi.python.org/pypi/socketpool"
arch=('any')
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/s/socketpool/socketpool-${pkgver}.tar.gz" "setup.py.diff")
md5sums=('24f542abc27293bf40c5223f2f8fb966'
         'e7c4ea766613764bfed4e9401d55f7a9')
sha256sums=('a06733434a56c4b60b8fcaa168102d2386253d36425804d55532a6bbbda6e2ec'
            'ce736b0338f8b5e0447bb25a301cd4b8c71652d5a11b6564a648a28228f13592')

prepare() {
  cd "$srcdir/socketpool-$pkgver"
  patch -uN setup.py ../../setup.py.diff || return 1
}

build() {
  cd "$srcdir/socketpool-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/socketpool-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  install -D -m644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
