# Maintainer: Melissa Padilla <mpadilla2 at hotmail dot com>
pkgname=('python2-socketpool')
pkgver=0.5.3
pkgrel=1
pkgdesc="A simple python socket pool"
url="https://pypi.python.org/pypi/socketpool"
arch=('any')
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/s/socketpool/socketpool-${pkgver}.tar.gz" "setup.py.diff")
md5sums=('24f542abc27293bf40c5223f2f8fb966'
         '46c7551834dcd9d7d6850b341c1085eb')
sha256sums=('a06733434a56c4b60b8fcaa168102d2386253d36425804d55532a6bbbda6e2ec'
            'f5c7705d78aa9d5cc0cda85aabb28139e88a6d26b42486d796bffc1dd7e6e167')

prepare() {
  cd "$srcdir/socketpool-$pkgver"
  patch -uN setup.py ../../setup.py.diff || return 1
}

build() {
  cd "$srcdir/socketpool-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/socketpool-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  install -D -m644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
