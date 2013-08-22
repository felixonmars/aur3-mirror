pkgname=2gis-tula
pkgver=33
pkgrel=1
pkgdesc="Map of Tula for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://tula.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Tula-33.orig.zip")
md5sums=('9a49b62377585b449d15908ffe93e75f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tula.dgdat" "${pkgdir}/opt/2gis/tula.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Tula.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/tula.dglf" || return 1
}
