# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-traits-doc
pkgver=4.3.0
pkgrel=1
pkgdesc="Documentation for Traits"
arch=('any')
url="https://github.com/enthought/traits"
license=('BSD')
makedepends=('python2-sphinx' "python2-traits=$pkgver")
conflicts=('python2-traits-doc-git' 'python-ets-traits-doc-svn')
options=(!emptydirs)

source=("https://github.com/enthought/traits/archive/${pkgver}.tar.gz")

build() {
  cd "$srcdir/traits-$pkgver/docs"
  make SPHINXBUILD=sphinx-build2 html
}

package() {
  cd "$srcdir/traits-$pkgver/docs"
  install -d "${pkgdir}"/usr/share/doc/enthought/traits
  cp -r build/html/* "${pkgdir}"/usr/share/doc/enthought/traits

  install -Dm644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('f78c15c44e0f965cc2ab799806a80388')
