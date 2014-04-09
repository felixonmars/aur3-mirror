pkgname=2gis-spb
pkgver=38
pkgrel=1
pkgdesc="Map of Saint-Petersburg for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://sankt-peterburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Spb-38.orig.zip")
md5sums=('c1705082fd31a9986b38b7993a6f8aba')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Spb.dgdat" "${pkgdir}/opt/2gis/2gis-spb.dgdat" || return 1
  
}
