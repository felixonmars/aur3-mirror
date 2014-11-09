pkgname=2gis-nizhnevartovsk
pkgver=102
pkgrel=1
pkgdesc="Map of Nizhnevartovsk for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/nizhnevartovsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Nizhnevartovsk-102.orig.zip")
md5sums=('0059eb241f605fdb8187ae5d5823a1d4')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Nizhnevartovsk.dgdat" "${pkgdir}/opt/2gis/2gis-nizhnevartovsk.dgdat" || return 1
  
}
