pkgname=2gis-chelyabinsk
pkgver=76
pkgrel=1
pkgdesc="Map of Chelyabinsk for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://chelyabinsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Chelyabinsk-76.orig.zip")
md5sums=('45d99014aefa46664bb428c71d6b3b2f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chelyabinsk.dgdat" "${pkgdir}/opt/2gis/chelyabinsk.dgdat" || return 1
  
}
