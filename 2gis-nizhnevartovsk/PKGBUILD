pkgname=2gis-nizhnevartovsk
pkgver=94
pkgrel=1
pkgdesc="Map of Nizhnevartovsk for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://nizhnevartovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Nizhnevartovsk-94.orig.zip")
md5sums=('0ffc2dcbee8c559650004d5b99e287be')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Nizhnevartovsk.dgdat" "${pkgdir}/opt/2gis/nizhnevartovsk.dgdat" || return 1
  
}
