pkgname=2gis-ufa
pkgver=73
pkgrel=1
pkgdesc="Map of Ufa for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://ufa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Ufa-73.orig.zip")
md5sums=('3701c41ede1324b810ebb1c23fee68a2')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ufa.dgdat" "${pkgdir}/opt/2gis/2gis-ufa.dgdat" || return 1
  
}
