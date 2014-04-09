pkgname=2gis-chelyabinsk
pkgver=80
pkgrel=1
pkgdesc="Map of Chelyabinsk for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://chelyabinsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Chelyabinsk-80.orig.zip")
md5sums=('707b68fc31e90e2b90da0ff1fdd1f6fe')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chelyabinsk.dgdat" "${pkgdir}/opt/2gis/2gis-chelyabinsk.dgdat" || return 1
  
}
