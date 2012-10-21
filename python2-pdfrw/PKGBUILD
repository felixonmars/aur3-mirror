# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-pdfrw
pkgver=0.1
pkgrel=1
pkgdesc="Basic PDF file manipulation library"
arch=('any')
url="https://code.google.com/p/pdfrw/"
license=('MIT')
depends=('python2')
source=(https://pdfrw.googlecode.com/files/pdfrw_${pkgver}.zip)
md5sums=("596b0d725a52013f5d151ace29e812f8")

build() {
  cd "$srcdir/pdfrw_${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}

# vim:ts=2:sw=2:et:
