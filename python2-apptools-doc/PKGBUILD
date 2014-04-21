# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-apptools-doc
pkgver=4.2.1
pkgrel=1
pkgdesc="Documentation for Apptools"
arch=('any')
url="https://github.com/enthought/apptools"
license=('BSD')
makedepends=('python2-sphinx' "python2-apptools=$pkgver")
conflicts=('python2-apptools-doc-git' 'python-ets-apptools-doc-svn')
options=(!emptydirs)

source=("https://github.com/enthought/apptools/archive/${pkgver}.tar.gz")

build() {
  cd "$srcdir/apptools-$pkgver/docs"
  make SPHINXBUILD=sphinx-build2 html
}

package() {
  cd "$srcdir/apptools-$pkgver/docs"
  install -d "${pkgdir}"/usr/share/doc/enthought/apptools
  cp -r build/html/* "${pkgdir}"/usr/share/doc/enthought/apptools

  install -Dm644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=('03f89b431db496082ac404456f97792f68b580ee77451e6f003b5a2830cd2f698124487045b6cd5fc15b700fbf7467553a384d6e638a322627f8dad7c0b45fc6')
