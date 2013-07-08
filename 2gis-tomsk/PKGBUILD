pkgname=2gis-tomsk
pkgver=103
pkgrel=1
pkgdesc="Map of Tomsk for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://tomsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Tomsk-103.orig.zip")
md5sums=('f42dcc92e10be1f46b710c5ba567bf6f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tomsk.dgdat" "${pkgdir}/opt/2gis/tomsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Tomsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/tomsk.dglf" || return 1
}
