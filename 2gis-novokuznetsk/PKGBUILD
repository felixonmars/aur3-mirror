pkgname=2gis-novokuznetsk
pkgver=102
pkgrel=1
pkgdesc="Map of Novokuznetsk for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://novokuznetsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Novokuznetsk-102.orig.zip")
md5sums=('e94c0417e194a8474b30f00a773205b7')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novokuznetsk.dgdat" "${pkgdir}/opt/2gis/novokuznetsk.dgdat" || return 1
  
}
