pkgname=2gis-voronezh
pkgver=45
pkgrel=1
pkgdesc="Map of Voronezh for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://voronezh.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Voronezh-45.orig.zip")
md5sums=('8098933e769c9f102d6261665484a42a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Voronezh.dgdat" "${pkgdir}/opt/2gis/2gis-voronezh.dgdat" || return 1
  
}
