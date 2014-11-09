pkgname=2gis-novokuznetsk
pkgver=111
pkgrel=1
pkgdesc="Map of Novokuznetsk for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/novokuznetsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Novokuznetsk-111.orig.zip")
md5sums=('ddca32cf4fb6dd03908ba9a24fccb6eb')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novokuznetsk.dgdat" "${pkgdir}/opt/2gis/2gis-novokuznetsk.dgdat" || return 1
  
}
