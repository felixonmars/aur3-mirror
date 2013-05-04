pkgname=2gis-oskol
pkgver=15
pkgrel=2
pkgdesc="Map of Stary Oskol for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://oskol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Staroskol-15.orig.zip")
md5sums=('91b67bc4b12c7f776200334d862fafe9')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Staroskol.dgdat" "${pkgdir}/opt/2gis/oskol.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Staroskol.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/oskol.dglf" || return 1
}
