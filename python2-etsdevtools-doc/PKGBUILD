# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-etsdevtools-doc
pkgver=4.0.2
pkgrel=1
pkgdesc="Documentation for Etsdevtools"
arch=('any')
url="https://github.com/enthought/etsdevtools"
license=('BSD')
makedepends=('python2-sphinx' "python2-etsdevtools=$pkgver")
conflicts=('python2-etsdevtools-doc-git')
options=(!emptydirs)
source=("https://github.com/enthought/etsdevtools/archive/${pkgver}.tar.gz")

build() {
  cd "$srcdir/etsdevtools-$pkgver/docs"
  make SPHINXBUILD=sphinx-build2 html
}

package() {
  cd "$srcdir/etsdevtools-$pkgver/docs"
  install -d "${pkgdir}"/usr/share/doc/enthought/etsdevtools
  cp -r build/html/* "${pkgdir}"/usr/share/doc/enthought/etsdevtools

  install -Dm644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('210a0085029bc2e4102f3e29304d9eb1')
