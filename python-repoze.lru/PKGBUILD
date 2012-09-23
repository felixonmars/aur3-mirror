# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: DasIch <dasdasich@googlemail.com>

_name=repoze.lru
pkgname=python-$_name
pkgver=0.6
pkgrel=1
pkgdesc="A tiny LRU cache implementation and decorator"
arch=('any')
license=('custom:BSD')
url="http://pypi.python.org/pypi/$_name"
depends=('python')
makedepends=('python-distribute')
provides=(python-repoze-lru)
conflicts=(python-repoze-lru)
replaces=(python-repoze-lru)
source=("http://pypi.python.org/packages/source/r/$_name/$_name-$pkgver.tar.gz")
md5sums=('2c3b64b17a8e18b405f55d46173e14dd')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/"

  # license
  install -Dm644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
