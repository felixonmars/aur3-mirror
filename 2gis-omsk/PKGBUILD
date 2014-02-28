pkgname=2gis-omsk
pkgver=114
pkgrel=1
pkgdesc="Map of Omsk for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://omsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Omsk-114.orig.zip")
md5sums=('9923c5d2f09e76a09fb3dea0813aa441')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Omsk.dgdat" "${pkgdir}/opt/2gis/omsk.dgdat" || return 1
  
}
