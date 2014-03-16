pkgname=2gis-novokuznetsk
pkgver=103
pkgrel=1
pkgdesc="Map of Novokuznetsk for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://novokuznetsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Novokuznetsk-103.orig.zip")
md5sums=('28a5c07bba8201ea85cced26676eae79')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novokuznetsk.dgdat" "${pkgdir}/opt/2gis/novokuznetsk.dgdat" || return 1
  
}
