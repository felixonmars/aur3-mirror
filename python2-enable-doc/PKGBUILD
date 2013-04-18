# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-enable-doc
pkgver=4.3.0
pkgrel=1
pkgdesc="Documentation for Enable"
arch=('any')
url="https://github.com/enthought/enable"
license=('BSD')
makedepends=('python2-sphinx' "python2-enable=$pkgver")
conflicts=('python2-enable-doc-git')
options=(!emptydirs)
source=("https://github.com/enthought/enable/archive/${pkgver}.tar.gz")

build() {
  cd "$srcdir/enable-$pkgver/docs"
  make SPHINXBUILD=sphinx-build2 html
}

package() {
  cd "$srcdir/enable-$pkgver/docs"
  install -d "${pkgdir}"/usr/share/doc/enthought/enable
  cp -r build/html/* "${pkgdir}"/usr/share/doc/enthought/enable

  install -Dm644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('6b4239add8d04bf12112ac22c84d7267')
