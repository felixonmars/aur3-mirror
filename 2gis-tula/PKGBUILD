pkgname=2gis-tula
pkgver=35
pkgrel=1
pkgdesc="Map of Tula for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://tula.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Tula-35.orig.zip")
md5sums=('9d32a26081f1291c0a6d62d5b10e88cb')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tula.dgdat" "${pkgdir}/opt/2gis/tula.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Tula.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/tula.dglf" || return 1
}
