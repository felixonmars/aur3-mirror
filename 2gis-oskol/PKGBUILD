pkgname=2gis-oskol
pkgver=25
pkgrel=1
pkgdesc="Map of Stary Oskol for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://oskol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Staroskol-25.orig.zip")
md5sums=('8e5f059c690763eaf79d08c87cd58d36')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Staroskol.dgdat" "${pkgdir}/opt/2gis/oskol.dgdat" || return 1
  
}
