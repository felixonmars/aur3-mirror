pkgname=2gis-tula
pkgver=30
pkgrel=2
pkgdesc="Map of Tula for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://tula.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Tula-30.orig.zip")
md5sums=('91b1e3fac3d87d5cedd65b3d993a7cab')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tula.dgdat" "${pkgdir}/opt/2gis/tula.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Tula.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/tula.dglf" || return 1
}
