pkgname=2gis-nnovgorod
pkgver=62
pkgrel=1
pkgdesc="Map of Nizhny Novgorod for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://nnovgorod.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_N_Novgorod-62.orig.zip")
md5sums=('2c8ce2daca6aedcbe1ec3d39e7415ae0')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_N_novgorod.dgdat" "${pkgdir}/opt/2gis/nnovgorod.dgdat" || return 1
  
}
