# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=python2-oset
pkgver=0.1.3
pkgrel=1
pkgdesc="A python ordered set library."
arch=('any')
url="http://pypi.python.org/pypi/oset"
license=('PSF')
depends=('python2')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/o/oset/oset-$pkgver.tar.gz")
md5sums=('f23e5a545d2c77df3916398d2d39a3ab')

prepare() {
  cd "$srcdir/oset-$pkgver"
  sed -i '1s|python|&2|' $(find . -name "*.py")
}

build() {
  cd "$srcdir/oset-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/oset-$pkgver"
  python2 setup.py install --root="$pkgdir/"

  # license
  install -Dm644 LICENSE.rst \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
