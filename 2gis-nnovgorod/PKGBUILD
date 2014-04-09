pkgname=2gis-nnovgorod
pkgver=67
pkgrel=1
pkgdesc="Map of Nizhny Novgorod for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://nizhniy-novgorod.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_N_Novgorod-67.orig.zip")
md5sums=('6418abcf271ebc148a335ee7d5479f6f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_N_Novgorod.dgdat" "${pkgdir}/opt/2gis/2gis-nnovgorod.dgdat" || return 1
  
}
