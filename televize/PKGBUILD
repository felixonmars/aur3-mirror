# Maintainer: Nicky726 <Nicky726 [at] gmail [dot] com>

pkgname=televize
pkgver=23
pkgrel=1
pkgdesc="CLI aplication to watch mainly Czech television streams"
arch=('any')
url="http://xpisar.wz.cz"
license=('GPL')
depends=('bash' 'wget' 'grep' 'sed' 'mplayer' 'ctstream')
source=(http://xpisar.wz.cz/${pkgname}/${pkgname}-${pkgver}
        http://xpisar.wz.cz/${pkgname}/${pkgname}-${pkgver}.asc)
sha256sums=('97caa1727229aee0cb517b3f10cc87f34319fbd85c7eab545a3c58aa3378608c'
            'b8747d01550b0dbf03cb9cf32daeaa65c208d31a16b6a438384f46e68519c70d')

package() {
  cd "${srcdir}"
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
