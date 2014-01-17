pkgname=2gis-penza
pkgver=33
pkgrel=1
pkgdesc="Map of Penza for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://penza.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Penza-33.orig.zip")
md5sums=('160eae46e5b9bc76a13997b758ce4f79')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Penza.dgdat" "${pkgdir}/opt/2gis/penza.dgdat" || return 1
  
}
