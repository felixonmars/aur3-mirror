pkgname=2gis-irkutsk
pkgver=89
pkgrel=1
pkgdesc="Map of Irkutsk for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://irkutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Irkutsk-89.orig.zip")
md5sums=('30f9c972e8e5f842e57dd8bcf867ba04')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Irkutsk.dgdat" "${pkgdir}/opt/2gis/irkutsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Irkutsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/irkutsk.dglf" || return 1
}
