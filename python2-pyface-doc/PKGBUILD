# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-pyface-doc
pkgver=4.3.0
pkgrel=1
pkgdesc="Documentation for Pyface"
arch=('any')
url="https://github.com/enthought/pyface"
license=('BSD')
makedepends=('python2-sphinx' "python2-pyface=$pkgver")
conflicts=('python2-pyface-doc-git')
options=(!emptydirs)

source=("https://github.com/enthought/pyface/archive/${pkgver}.tar.gz")

build() {
  cd "$srcdir/pyface-$pkgver/docs"
  make SPHINXBUILD=sphinx-build2 html
}

package() {
  cd "$srcdir/pyface-$pkgver/docs"
  install -d "${pkgdir}"/usr/share/doc/enthought/pyface
  cp -r build/html/* "${pkgdir}"/usr/share/doc/enthought/pyface

  install -Dm644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('0ebc97074dc8d7170c03048108055759')
