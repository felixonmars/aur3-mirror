pkgname=2gis-penza
pkgver=34
pkgrel=1
pkgdesc="Map of Penza for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://penza.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Penza-34.orig.zip")
md5sums=('14e96022b3303500fb49f006c3621ed7')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Penza.dgdat" "${pkgdir}/opt/2gis/penza.dgdat" || return 1
  
}
