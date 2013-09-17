pkgname=2gis-odessa
pkgver=79
pkgrel=1
pkgdesc="Map of Odessa for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://odessa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Odessa-79.orig.zip")
md5sums=('a6fc18f44d69645d8f28b85c664c940e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Odessa.dgdat" "${pkgdir}/opt/2gis/odessa.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Odessa.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/odessa.dglf" || return 1
}
