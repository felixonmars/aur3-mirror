pkgname=2gis-nnovgorod
pkgver=66
pkgrel=1
pkgdesc="Map of Nizhny Novgorod for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://nnovgorod.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_N_Novgorod-66.orig.zip")
md5sums=('b688d53635ccc95e0296ad59cc7c2925')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_N_novgorod.dgdat" "${pkgdir}/opt/2gis/nnovgorod.dgdat" || return 1
  
}
