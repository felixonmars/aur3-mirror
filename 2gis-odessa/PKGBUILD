pkgname=2gis-odessa
pkgver=75
pkgrel=2
pkgdesc="Map of Odessa for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://odessa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Odessa-75.orig.zip")
md5sums=('824b555f02e81e39b6b9d3e60d306616')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Odessa.dgdat" "${pkgdir}/opt/2gis/odessa.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Odessa.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/odessa.dglf" || return 1
}
