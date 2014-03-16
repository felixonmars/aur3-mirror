pkgname=2gis-kemerovo
pkgver=107
pkgrel=1
pkgdesc="Map of Kemerovo for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://kemerovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kemerovo-107.orig.zip")
md5sums=('eb1bec3cb342025fe64047f4aef4fa1b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kemerovo.dgdat" "${pkgdir}/opt/2gis/kemerovo.dgdat" || return 1
  
}
