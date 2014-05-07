pkgname=2gis-krasnoyarsk
pkgver=105
pkgrel=1
pkgdesc="Map of Krasnoyarsk for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://krasnoyarsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Krasnoyarsk-105.orig.zip")
md5sums=('7fc5fa01caf3b79a7890d0d5f68e3357')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnoyarsk.dgdat" "${pkgdir}/opt/2gis/2gis-krasnoyarsk.dgdat" || return 1
  
}
