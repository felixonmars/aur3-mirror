pkgname=2gis-novokuznetsk
pkgver=107
pkgrel=1
pkgdesc="Map of Novokuznetsk for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/novokuznetsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Novokuznetsk-107.orig.zip")
md5sums=('9ed1e8ca4aca4bb6df6e7bb0344426db')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novokuznetsk.dgdat" "${pkgdir}/opt/2gis/2gis-novokuznetsk.dgdat" || return 1
  
}
