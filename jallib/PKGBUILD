# Maintainer: Matias De la Puente <mfpuente.ar@gmail.com>
pkgname=jallib
pkgver=0.8.0
pkgrel=1
pkgdesc="JAL V2 libraries"
arch=('any')
url="http://code.google.com/p/jallib/"
license=('BSD' 'ZLIB')
depends=('jalv2')
options=(!strip)
source=(http://jallib.googlecode.com/files/${pkgname}-${pkgver}.zip)
sha256sums=('53e33e1b0be2fad93afae254127eb91763a66774d84c30a566f7e4faf6859419')

package() {
  cd "${srcdir}"
  
  # install libraries
  install -dm755 "${pkgdir}/usr/share/${pkgname}/lib"
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/lib/" lib/*
  
  # install doc
  install -dm755 "${pkgdir}/usr/share/${pkgname}/doc/html"
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/doc/html/" doc/html/*
  
  # install samples
  install -dm755 "${pkgdir}/usr/share/${pkgname}/sample"
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/sample/" sample/*
  
  # install licenses
  install -Dm644 LICENSE.bsd "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.bsd"
  install -Dm644 LICENSE.zlib "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.zlib"
}

