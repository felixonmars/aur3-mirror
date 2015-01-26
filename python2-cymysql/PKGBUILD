# Maintainer: Melissa Padilla <mpadilla2 at hotmail dot com>
pkgname=('python2-cymysql')
pkgver=0.7.8
pkgrel=1
pkgdesc="A python MySQL client library"
url="https://pypi.python.org/pypi/cymysql"
arch=('any')
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('cython: C-Extensions for Python')
source=(https://pypi.python.org/packages/source/c/cymysql/cymysql-${pkgver}.tar.gz)
md5sums=('0a815ee9abb79a59a99f3112b352a637')
sha256sums=('9efd9a0f4dab2b58c9ef2cd2364d59b42768314bd765af6313c199647083d7d9')

build() {
  cd "$srcdir/cymysql-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/cymysql-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

