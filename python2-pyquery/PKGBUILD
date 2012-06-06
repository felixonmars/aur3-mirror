# Maintainer : speps <speps at aur dot archlinux dot org>

_name=pyquery
pkgname=python2-pyquery
pkgver=1.2.1
pkgrel=2
pkgdesc="A jquery-like library for python."
arch=('any')
url="http://www.bitbucket.org/olauzanne/pyquery"
license=('custom:BSD')
depends=('python2-lxml' 'python2-cssselect')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/p/$_name/$_name-$pkgver.tar.gz"
        "https://bitbucket.org/olauzanne/pyquery/raw/b70710332032/LICENSE.txt")
md5sums=('f4564c372e3905772d0fe094bc00baf6'
         '4f88ad79969b924fb6038be3de456dee')
 
build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/"

  # license
  install -Dm644 ../LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
