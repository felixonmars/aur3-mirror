pkgname=2gis-khabarovsk
pkgver=32
pkgrel=1
pkgdesc="Map of Khabarovsk for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://khabarovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Khabarovsk-32.orig.zip")
md5sums=('81e5365641b7b9b1727e3102bf34d3d3')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Khabarovsk.dgdat" "${pkgdir}/opt/2gis/khabarovsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Khabarovsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/khabarovsk.dglf" || return 1
}
