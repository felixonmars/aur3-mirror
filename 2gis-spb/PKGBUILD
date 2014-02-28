pkgname=2gis-spb
pkgver=36
pkgrel=1
pkgdesc="Map of Saint-Petersburg for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://spb.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Spb-36.orig.zip")
md5sums=('a0c53a34eb5f05f22c9f7f4f6822e4df')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Spb.dgdat" "${pkgdir}/opt/2gis/spb.dgdat" || return 1
  
}
