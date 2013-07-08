pkgname=2gis-spb
pkgver=29
pkgrel=1
pkgdesc="Map of Saint-Petersburg for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://spb.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Spb-29.orig.zip")
md5sums=('c451bc18053342de0bb91b626e9794fa')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Spb.dgdat" "${pkgdir}/opt/2gis/spb.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Spb.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/spb.dglf" || return 1
}
