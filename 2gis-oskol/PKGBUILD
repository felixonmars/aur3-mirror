pkgname=2gis-oskol
pkgver=14
pkgrel=2
pkgdesc="Map of Stary Oskol for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://oskol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Staroskol-14.orig.zip")
md5sums=('bb880e925bdcb3381d30c1f793519ad6')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Stary Oskol.dgdat "${pkgdir}/opt/2gis/oskol.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Stary Oskol.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Stary Oskol.dglf" || return 1
}
