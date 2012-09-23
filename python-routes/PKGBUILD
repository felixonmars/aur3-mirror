# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor : David Moore <davidm@sjsoft.com>
# Contributor: Nathan Jones <nathanj@insightbb.com>

pkgname=python-routes
pkgver=1.13
pkgrel=2
pkgdesc="A routing package for Python that matches URL's to dicts and vice versa"
arch=('any')
url="http://pypi.python.org/pypi/Routes"
license=('custom:BSD')
depends=('python-repoze.lru')
makedepends=('python-distribute')
source=("http://pypi.python.org/packages/source/R/Routes/Routes-$pkgver.tar.gz")
md5sums=('d527b0ab7dd9172b1275a41f97448783')

build() {
  cd "$srcdir/Routes-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/Routes-$pkgver"

  python setup.py install --root="$pkgdir/"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

