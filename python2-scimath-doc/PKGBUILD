# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-scimath-doc
pkgver=4.1.2
pkgrel=1
pkgdesc="Documentation for Scimath"
arch=('any')
url="https://github.com/enthought/scimath"
license=('BSD')
makedepends=('python2-sphinx' "python2-scimath=$pkgver")
conflicts=('python2-scimath-doc-git')
options=(!emptydirs)
source=("https://github.com/enthought/scimath/archive/${pkgver}.tar.gz")

build() {
  cd "$srcdir/scimath-$pkgver/docs"
  make SPHINXBUILD=sphinx-build2 html
}

package() {
  cd "$srcdir/scimath-$pkgver/docs"
  install -d "${pkgdir}"/usr/share/doc/enthought/scimath
  cp -r build/html/* "${pkgdir}"/usr/share/doc/enthought/scimath

  install -Dm644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('e21f52ff91b2aaa582dc3276f51245a1')
