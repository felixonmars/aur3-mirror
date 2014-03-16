pkgname=2gis-perm
pkgver=75
pkgrel=1
pkgdesc="Map of Perm for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://perm.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Perm-75.orig.zip")
md5sums=('5664566767f7a100de28502d3e0ab946')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Perm.dgdat" "${pkgdir}/opt/2gis/perm.dgdat" || return 1
  
}
