pkgname=2gis-ulanude
pkgver=31
pkgrel=1
pkgdesc="Map of Ulan-Ude for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://ulanude.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Ulanude-31.orig.zip")
md5sums=('e616c3c232f3fdf1572c53cb03a33caa')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ulanude.dgdat" "${pkgdir}/opt/2gis/ulanude.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Ulanude.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/ulanude.dglf" || return 1
}
