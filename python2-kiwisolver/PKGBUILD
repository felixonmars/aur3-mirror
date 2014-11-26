# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-kiwisolver
pkgver=0.1.3
pkgrel=1
pkgdesc="A fast implementation of the Cassowary constraint solver"
arch=('i686' 'x86_64')
url="https://github.com/nucleic/kiwi"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)

source=("https://github.com/nucleic/kiwi/archive/$pkgver.tar.gz")
md5sums=('f58a1255b40af665f9ae7e58f5f06ac2')

build() {
  cd "$srcdir/kiwi-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/kiwi-$pkgver"

  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

