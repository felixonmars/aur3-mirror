# Maintainer: Alexander Minges <alexander.minges[at]gmail[dot]com>
pkgname=sap
pkgver=1.1.3
pkgrel=1
pkgdesc="Pairwise protein structure alignment via double dynamic programming."
url="http://mathbio.nimr.mrc.ac.uk/wiki/Software#SAP"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=()
makedepends=('gcc')
source=("http://mathbio.nimr.mrc.ac.uk/download/SAP/${pkgname}-${pkgver}.tgz")
sha256sums=('b6b136ae96c4a02af4657a122346ba07897955c566d02ca829038bf87b5cf63c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et: 
