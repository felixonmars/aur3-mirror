pkgname=2gis-penza
pkgver=35
pkgrel=1
pkgdesc="Map of Penza for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://penza.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Penza-35.orig.zip")
md5sums=('bdb38b9f83a431a34aac971cdd619af6')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Penza.dgdat" "${pkgdir}/opt/2gis/penza.dgdat" || return 1
  
}
