pkgname=2gis-spb
pkgver=42
pkgrel=1
pkgdesc="Map of Saint-Petersburg for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/sankt-peterburg/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Spb-42.orig.zip")
md5sums=('f8df5ccad5d657320fd9bd5acf0c4740')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Spb.dgdat" "${pkgdir}/opt/2gis/2gis-spb.dgdat" || return 1
  
}
