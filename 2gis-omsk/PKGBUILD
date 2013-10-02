pkgname=2gis-omsk
pkgver=110
pkgrel=1
pkgdesc="Map of Omsk for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://omsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Omsk-110.orig.zip")
md5sums=('fa2d1a5a3a8864babe1fb66dee1c8066')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Omsk.dgdat" "${pkgdir}/opt/2gis/omsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Omsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/omsk.dglf" || return 1
}
