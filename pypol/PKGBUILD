# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=pypol
pkgver=0.3
pkgrel=1
pkgdesc="Library that allows manipulation of polynomials"
arch=('any')
url="http://pypol.altervista.org"
license=('GPL')
depends=('python')
makedepends=('setuptools')
source=("http://github.com/downloads/rubik/$pkgname/${pkgname}_-${pkgver}.tar.gz")
md5sums=('c6bdd92ba3f899c361a95c01c3d1fbd5')

build() {
  cd "$srcdir/${pkgname}_-${pkgver}"

  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}_-${pkgver}"

  python setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
