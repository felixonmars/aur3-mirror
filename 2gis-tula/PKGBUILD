pkgname=2gis-tula
pkgver=29
pkgrel=2
pkgdesc="Map of Tula for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://tula.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Tula-29.orig.zip")
md5sums=('6d274dc60ab1828d1eadbb1fcab96db1')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Tula.dgdat "${pkgdir}/opt/2gis/tula.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Tula.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Tula.dglf" || return 1
}
