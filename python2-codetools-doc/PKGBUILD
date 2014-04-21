# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-codetools-doc
pkgver=4.2.0
pkgrel=1
pkgdesc="Documentation for Codetools"
arch=('any')
url="https://github.com/enthought/codetools"
license=('BSD')
makedepends=('python2-sphinx' "python2-codetools=$pkgver")
conflicts=('python2-codetools-doc-git')
options=(!emptydirs)
source=("https://github.com/enthought/codetools/archive/${pkgver}.tar.gz")

build() {
  cd "$srcdir/codetools-$pkgver/docs"
  make SPHINXBUILD=sphinx-build2 html
}

package() {
  cd "$srcdir/codetools-$pkgver/docs"
  install -d "${pkgdir}"/usr/share/doc/enthought/codetools
  cp -r build/html/* "${pkgdir}"/usr/share/doc/enthought/codetools

  install -Dm644 "../LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=('accb735390a59ad542cb0d55665a0b9ad8205817dde1f040282e47d5255ba46d5466f1aac867fedd38a6a9cc5682e9d72f99be7cc09a2717d0218b52d546cccc')
