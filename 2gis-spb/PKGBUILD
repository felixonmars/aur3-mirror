pkgname=2gis-spb
pkgver=26
pkgrel=1
pkgdesc="Map of Saint-Petersburg for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://spb.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Spb-26.orig.zip")
md5sums=('162c0c0850f69cb6cdf01a403a4f3fcd')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Saint-Petersburg.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Saint-Petersburg.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Saint-Petersburg.dglf" || return 1
}
