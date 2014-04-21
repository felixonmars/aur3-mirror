# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-chaco-doc
pkgver=4.4.1
pkgrel=1
pkgdesc="Documentation for Chaco"
arch=('any')
url="https://github.com/enthought/chaco"
license=('BSD')
makedepends=('python2-sphinx' "python2-chaco=$pkgver")
conflicts=('python2-chaco-doc-git' 'python-ets-chaco-doc-svn')
options=(!emptydirs)
source=("https://github.com/enthought/chaco/archive/${pkgver}.tar.gz")

build() {
  cd "$srcdir/chaco-$pkgver/docs"
  make SPHINXBUILD=sphinx-build2 html
}

package() {
  cd "$srcdir/chaco-$pkgver/docs"
  install -d "${pkgdir}"/usr/share/doc/enthought/chaco
  cp -r build/html/* "${pkgdir}"/usr/share/doc/enthought/chaco

  install -Dm644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=('b3bf7f7b979967c5bb1c6767fbf135f31392b521582bffebf0f9b80aa0203849175a51e4ff2ef4391529ed6ab70f023443f9b1808a1cffe0d9fb40912735aa6d')
