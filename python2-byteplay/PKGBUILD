# Maintainer: Duncan Townsend <duncant@mit.edu>

pkgname='python2-byteplay'
pkgver=0.2
pkgrel=1
pkgdesc='Python bytecode assembler/disassembler'
arch=('any')
depends=('python2')
url='https://code.google.com/p/byteplay/'
license=('LGPL')
makedepends=('python2' 'python2-distribute')
source=("https://byteplay.googlecode.com/files/byteplay-${pkgver}.tar.gz")
sha256sums=('18c40a0e0b4e5936f1e70e7e85d1cbcfacd03522993c78c45f01d5ebfb9895b1')
build() {
  # Make python and python2 builds possible
  cd "$srcdir/byteplay-$pkgver"

  python2 setup.py build
}

package_python2-byteplay() {
  cd "${srcdir}/byteplay-${pkgver}"

  python2 setup.py install --root="${pkgdir}" --optimize=1
}
