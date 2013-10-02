pkgname=2gis-yakutsk
pkgver=26
pkgrel=1
pkgdesc="Map of Yakutsk for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://yakutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Yakutsk-26.orig.zip")
md5sums=('ad3698b89135d9789e0e725c9bd70c0a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yakutsk.dgdat" "${pkgdir}/opt/2gis/yakutsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Yakutsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/yakutsk.dglf" || return 1
}
