pkgname=2gis-ufa
pkgver=67
pkgrel=1
pkgdesc="Map of Ufa for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://ufa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Ufa-67.orig.zip")
md5sums=('a4679eed99eac1b4473105213ce52aec')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ufa.dgdat" "${pkgdir}/opt/2gis/ufa.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Ufa.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/ufa.dglf" || return 1
}
