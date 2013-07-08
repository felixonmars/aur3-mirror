pkgname=2gis-oskol
pkgver=17
pkgrel=1
pkgdesc="Map of Stary Oskol for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://oskol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Staroskol-17.orig.zip")
md5sums=('76ec8af96fa4eeb4ee934b054a5cb3eb')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Staroskol.dgdat" "${pkgdir}/opt/2gis/oskol.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Staroskol.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/oskol.dglf" || return 1
}
