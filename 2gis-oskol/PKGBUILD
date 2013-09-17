pkgname=2gis-oskol
pkgver=19
pkgrel=1
pkgdesc="Map of Stary Oskol for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://oskol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Staroskol-19.orig.zip")
md5sums=('f8fe6b8ea8b3f068831c13c5653cb595')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Staroskol.dgdat" "${pkgdir}/opt/2gis/oskol.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Staroskol.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/oskol.dglf" || return 1
}
