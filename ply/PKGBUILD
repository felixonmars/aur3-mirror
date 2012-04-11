# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Mikko Sysikaski <mikko.sysikaski@gmail.com>

pkgname=ply
pkgver=3.4
pkgrel=1
pkgdesc="Implementation of lex and yacc parsing tools for Python"
arch=('any')
url="http://www.dabeaz.com/ply/"
license=('LGPL')
depends=('python')
source=("http://www.dabeaz.com/ply/$pkgname-$pkgver.tar.gz")
sha1sums=('123b9449b838dc387b240ea737a33b6407e5a1ac')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
