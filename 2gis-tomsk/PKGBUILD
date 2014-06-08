pkgname=2gis-tomsk
pkgver=114
pkgrel=1
pkgdesc="Map of Tomsk for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/tomsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Tomsk-114.orig.zip")
md5sums=('94c3dabead2c865065cf5afb4f07528c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tomsk.dgdat" "${pkgdir}/opt/2gis/2gis-tomsk.dgdat" || return 1
  
}
