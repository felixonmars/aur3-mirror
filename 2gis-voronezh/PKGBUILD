pkgname=2gis-voronezh
pkgver=33
pkgrel=2
pkgdesc="Map of Voronezh for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://voronezh.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Voronezh-33.orig.zip")
md5sums=('1e3040228dc744bf1391ba88d2e2f94c')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Voronezh.dgdat "${pkgdir}/opt/2gis/voronezh.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Voronezh.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Voronezh.dglf" || return 1
}
