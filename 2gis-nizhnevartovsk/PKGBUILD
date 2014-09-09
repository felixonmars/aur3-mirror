pkgname=2gis-nizhnevartovsk
pkgver=100
pkgrel=1
pkgdesc="Map of Nizhnevartovsk for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/nizhnevartovsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Nizhnevartovsk-100.orig.zip")
md5sums=('2218379279aa50278e38f367953cb17f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Nizhnevartovsk.dgdat" "${pkgdir}/opt/2gis/2gis-nizhnevartovsk.dgdat" || return 1
  
}
