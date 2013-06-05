pkgname=2gis-nnovgorod
pkgver=57
pkgrel=1
pkgdesc="Map of Nizhny Novgorod for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://nnovgorod.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_N_Novgorod-57.orig.zip")
md5sums=('508ba60d07175f985a95843210c59376')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_N_Novgorod.dgdat" "${pkgdir}/opt/2gis/nnovgorod.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/N_Novgorod.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/nnovgorod.dglf" || return 1
}
