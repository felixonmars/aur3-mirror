pkgname=2gis-penza
pkgver=37
pkgrel=1
pkgdesc="Map of Penza for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://penza.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Penza-37.orig.zip")
md5sums=('32cc0c281ebd2b10560c062bc7c2acae')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Penza.dgdat" "${pkgdir}/opt/2gis/2gis-penza.dgdat" || return 1
  
}
