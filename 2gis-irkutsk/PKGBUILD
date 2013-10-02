pkgname=2gis-irkutsk
pkgver=90
pkgrel=1
pkgdesc="Map of Irkutsk for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://irkutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Irkutsk-90.orig.zip")
md5sums=('9c9c0b593492d9556f3050cc2a8fa5ff')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Irkutsk.dgdat" "${pkgdir}/opt/2gis/irkutsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Irkutsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/irkutsk.dglf" || return 1
}
