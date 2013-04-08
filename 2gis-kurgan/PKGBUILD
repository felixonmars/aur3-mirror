pkgname=2gis-kurgan
pkgver=85
pkgrel=1
pkgdesc="Map of Kurgan for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://kurgan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Kurgan-85.orig.zip")
md5sums=('990a6abef7e3a140779dd5cbb8c00cd0')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Kurgan.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Kurgan.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Kurgan.dglf" || return 1
}
