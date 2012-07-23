# Contributor: Beej Jorgensen <beej@beej.us>
# Maintainer: Beej Jorgensen <beej@beej.us>
pkgname=pypng
pkgver=0.0.13
pkgrel=1
pkgdesc="Python 2 module to decode and encode PNG files"
arch=('any')
url="http://code.google.com/p/pypng/"
license=('MIT')
depends=('python2')
makedepends=('python2')
source=(http://pypng.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('535f9932c8589bb02d4043aaeb4c5b72')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
