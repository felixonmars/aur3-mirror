# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-envisage-doc
pkgver=4.4.0
pkgrel=1
pkgdesc="Documentation for Envisage"
arch=('any')
url="https://github.com/enthought/envisage"
license=('BSD')
makedepends=('python2-sphinx' "python2-envisage=$pkgver")
conflicts=('python2-envisage-doc-git')
options=(!emptydirs)
source=("https://github.com/enthought/envisage/archive/${pkgver}.tar.gz")

build() {
  cd "$srcdir/envisage-$pkgver/docs"
  make SPHINXBUILD=sphinx-build2 html
}

package() {
  cd "$srcdir/envisage-$pkgver/docs"
  install -d "${pkgdir}"/usr/share/doc/enthought/envisage
  cp -r build/html/* "${pkgdir}"/usr/share/doc/enthought/envisage

  install -Dm644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=('f9e6856539592efe00fa9e76ddf77a8d6c6b9a967ead622dbcd7c5bd99b23f440856452b0aa83fb7a1cc8edea69469e8a7574669dfa0e27184e1bbdccf9b71c2')
