pkgname=2gis-orenburg
pkgver=27
pkgrel=1
pkgdesc="Map of Orenburg for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://orenburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Orenburg-27.orig.zip")
md5sums=('a6e53846298516b4335439b0f04bf40d')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Orenburg.dgdat" "${pkgdir}/opt/2gis/orenburg.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Orenburg.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/orenburg.dglf" || return 1
}
