pkgname=2gis-nnovgorod
pkgver=70
pkgrel=1
pkgdesc="Map of Nizhny Novgorod for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/nizhniy-novgorod/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_N_Novgorod-70.orig.zip")
md5sums=('7355080178876befe38d13e213dd761f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_N_Novgorod.dgdat" "${pkgdir}/opt/2gis/2gis-nnovgorod.dgdat" || return 1
  
}
