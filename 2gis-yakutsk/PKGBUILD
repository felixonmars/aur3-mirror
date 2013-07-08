pkgname=2gis-yakutsk
pkgver=23
pkgrel=1
pkgdesc="Map of Yakutsk for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://yakutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Yakutsk-23.orig.zip")
md5sums=('c1b9f08486162cf523f93f84197133bd')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yakutsk.dgdat" "${pkgdir}/opt/2gis/yakutsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Yakutsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/yakutsk.dglf" || return 1
}
