pkgname=2gis-kemerovo
pkgver=101
pkgrel=1
pkgdesc="Map of Kemerovo for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://kemerovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Kemerovo-101.orig.zip")
md5sums=('e3a67a023147adecefced9bbc30e313a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kemerovo.dgdat" "${pkgdir}/opt/2gis/kemerovo.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kemerovo.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kemerovo.dglf" || return 1
}
