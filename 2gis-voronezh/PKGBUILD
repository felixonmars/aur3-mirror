pkgname=2gis-voronezh
pkgver=42
pkgrel=1
pkgdesc="Map of Voronezh for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://voronezh.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Voronezh-42.orig.zip")
md5sums=('f20328eeba48e0a34d7823ab9b2e1db8')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Voronezh.dgdat" "${pkgdir}/opt/2gis/voronezh.dgdat" || return 1
  
}
