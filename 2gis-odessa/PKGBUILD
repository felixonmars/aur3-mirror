pkgname=2gis-odessa
pkgver=76
pkgrel=1
pkgdesc="Map of Odessa for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://odessa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Odessa-76.orig.zip")
md5sums=('8f5e950e856d5d16537427901507eceb')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Odessa.dgdat" "${pkgdir}/opt/2gis/odessa.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Odessa.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/odessa.dglf" || return 1
}
