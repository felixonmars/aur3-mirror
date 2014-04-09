pkgname=2gis-novokuznetsk
pkgver=104
pkgrel=1
pkgdesc="Map of Novokuznetsk for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://novokuznetsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Novokuznetsk-104.orig.zip")
md5sums=('2310dc83a8e4c530474de9e8ced3b603')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novokuznetsk.dgdat" "${pkgdir}/opt/2gis/2gis-novokuznetsk.dgdat" || return 1
  
}
