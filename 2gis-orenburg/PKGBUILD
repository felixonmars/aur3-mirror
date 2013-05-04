pkgname=2gis-orenburg
pkgver=22
pkgrel=2
pkgdesc="Map of Orenburg for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://orenburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Orenburg-22.orig.zip")
md5sums=('607b823bff435ada4288066c4a89e614')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Orenburg.dgdat" "${pkgdir}/opt/2gis/orenburg.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Orenburg.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/orenburg.dglf" || return 1
}
