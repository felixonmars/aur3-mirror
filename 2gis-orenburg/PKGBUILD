pkgname=2gis-orenburg
pkgver=21
pkgrel=1
pkgdesc="Map of Orenburg for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://orenburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Orenburg-21.orig.zip")
md5sums=('9e26727a268d107f24ea674f19607123')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Orenburg.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Orenburg.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Orenburg.dglf" || return 1
}
