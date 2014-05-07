pkgname=2gis-nnovgorod
pkgver=68
pkgrel=1
pkgdesc="Map of Nizhny Novgorod for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://nizhniy-novgorod.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_N_Novgorod-68.orig.zip")
md5sums=('af6904a4b381bc9551b30874e2fa54c4')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_N_Novgorod.dgdat" "${pkgdir}/opt/2gis/2gis-nnovgorod.dgdat" || return 1
  
}
