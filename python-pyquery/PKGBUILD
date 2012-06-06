# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Arnau Sanchez <tokland {at} gmail {dot} com>

_name=pyquery
pkgname=python-pyquery
pkgver=1.2.1
pkgrel=2
pkgdesc="A jquery-like library for python."
arch=('any')
url="http://www.bitbucket.org/olauzanne/pyquery"
license=('custom:BSD')
depends=('python-lxml' 'python-cssselect')
makedepends=('python-distribute')
source=("http://pypi.python.org/packages/source/p/$_name/$_name-$pkgver.tar.gz"
        "https://bitbucket.org/olauzanne/pyquery/raw/b70710332032/LICENSE.txt")
md5sums=('f4564c372e3905772d0fe094bc00baf6'
         '4f88ad79969b924fb6038be3de456dee')
 
build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/"

  # license
  install -Dm644 ../LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
