pkgname=2gis-krasnodar
pkgver=53
pkgrel=1
pkgdesc="Map of Krasnodar for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/krasnodar/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Krasnodar-53.orig.zip")
md5sums=('92eac337c4ef68fa8ebb4196fd12a206')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnodar.dgdat" "${pkgdir}/opt/2gis/2gis-krasnodar.dgdat" || return 1
  
}
