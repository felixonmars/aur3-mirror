# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-casuarius
pkgver=1.1
pkgrel=1
pkgdesc="Cython binding for Cassowary"
arch=('i686' 'x86_64')
url="https://github.com/enthought/casuarius"
license=('LGPL')
depends=('python2')
makedepends=('python2-distribute' 'cython2')
options=(!emptydirs)

source=("https://github.com/enthought/casuarius/archive/$pkgver.tar.gz")
md5sums=('792fb1f424125fbca2fe891b2bf94e71')

build() {
  cd "$srcdir/casuarius-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/casuarius-$pkgver"

  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

