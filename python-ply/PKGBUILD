# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Marcin "avalan" Falkiewicz <avalatron@gmail.com>
# Contributor: C Anthony Risinger <anthony@xtfx.me>

pkgname=python-ply
pkgver=3.4
pkgrel=2
pkgdesc='Implementation of lex and yacc parsing tools'
arch=('any')
url='http://www.dabeaz.com/ply/'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("${url}ply-$pkgver.tar.gz")
sha256sums=('af435f11b7bdd69da5ffbc3fecb8d70a7073ec952e101764c88720cdefb2546b')

package() {
  cd "${pkgname#python-}-$pkgver"

  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
