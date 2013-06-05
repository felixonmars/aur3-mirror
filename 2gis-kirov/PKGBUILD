pkgname=2gis-kirov
pkgver=17
pkgrel=1
pkgdesc="Map of Kirov for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://kirov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Kirov-17.orig.zip")
md5sums=('f68b58001056ba793300589c096cde19')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kirov.dgdat" "${pkgdir}/opt/2gis/kirov.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kirov.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kirov.dglf" || return 1
}
