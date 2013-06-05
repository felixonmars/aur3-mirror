pkgname=2gis-yakutsk
pkgver=22
pkgrel=1
pkgdesc="Map of Yakutsk for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://yakutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Yakutsk-22.orig.zip")
md5sums=('8f4722c907cd25a23f380e0fcdee89bc')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yakutsk.dgdat" "${pkgdir}/opt/2gis/yakutsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Yakutsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/yakutsk.dglf" || return 1
}
