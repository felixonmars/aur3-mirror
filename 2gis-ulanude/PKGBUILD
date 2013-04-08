pkgname=2gis-ulanude
pkgver=27
pkgrel=2
pkgdesc="Map of Ulan-Ude for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://ulanude.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Ulanude-27.orig.zip")
md5sums=('7f20de796d4d92f8fda674ef365e0667')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Ulan-Ude.dgdat "${pkgdir}/opt/2gis/ulanude.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Ulan-Ude.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Ulan-Ude.dglf" || return 1
}
