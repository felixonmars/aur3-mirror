# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-traitsui-doc
pkgver=4.3.0
pkgrel=1
pkgdesc="Documentation for Traitsui"
arch=('any')
url="https://github.com/enthought/traitsui"
license=('BSD')
makedepends=('python2-sphinx' "python2-traitsui=$pkgver")
conflicts=('python2-traitsui-doc-git')
options=(!emptydirs)

source=("https://github.com/enthought/traitsui/archive/${pkgver}.tar.gz")

build() {
  cd "$srcdir/traitsui-$pkgver/docs"
  make SPHINXBUILD=sphinx-build2 html
}

package() {
  cd "$srcdir/traitsui-$pkgver/docs"
  install -d "${pkgdir}"/usr/share/doc/enthought/traitsui
  cp -r build/html/* "${pkgdir}"/usr/share/doc/enthought/traitsui

  install -Dm644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('23b63f254d268666c816f1954c34b41a')
