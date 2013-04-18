# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-blockcanvas-doc
pkgver=4.0.3
pkgrel=1
pkgdesc="Documentation for Blockcanvas"
arch=('any')
url="https://github.com/enthought/blockcanvas"
license=('BSD')
makedepends=('python2-sphinx' "python2-blockcanvas=$pkgver")
conflicts=('python2-blockcanvas-doc-git')
options=(!emptydirs)
source=("https://github.com/enthought/blockcanvas/archive/${pkgver}.tar.gz")

build() {
  cd "$srcdir/blockcanvas-$pkgver/docs"
  make SPHINXBUILD=sphinx-build2 html
}

package() {
  cd "$srcdir/blockcanvas-$pkgver/docs"
  install -d "${pkgdir}"/usr/share/doc/enthought/blockcanvas
  cp -r build/html/* "${pkgdir}"/usr/share/doc/enthought/blockcanvas

  install -Dm644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('31e722b31a92dea0d68cbc8138db7b59')
