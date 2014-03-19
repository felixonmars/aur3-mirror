# Maintainer: osily <ly50247 at 126 dot com>

pkgname='shcov'
pkgver=5
pkgrel=1
pkgdesc='A gcov and lcov coverage test tool for bourne shell / bash scripts'
arch=('any')
url='http://code.google.com/p/shcov/'
license=('GPL2')
depends=( 'python2')
source=("http://shcov.googlecode.com/files/shcov-$pkgver.tar.gz")
sha256sums=('199bd992796f2a6d222f1dc2f6b490f57f0b00a20ba8e926e084708a839ba12f')

prepare() {
  ls shcov-$pkgver
  sed -i 's:env python:env python2:' "shcov-$pkgver/scripts/shcov"
  sed -i 's:env python:env python2:' "shcov-$pkgver/scripts/shlcov"
}

package() {
  cd "shcov-$pkgver"
  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
