pkgname=2gis-yakutsk
pkgver=21
pkgrel=2
pkgdesc="Map of Yakutsk for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://yakutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Yakutsk-21.orig.zip")
md5sums=('5bc24e5120abd209878ebfa800d12868')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yakutsk.dgdat" "${pkgdir}/opt/2gis/yakutsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Yakutsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/yakutsk.dglf" || return 1
}
