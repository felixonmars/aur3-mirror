pkgname=2gis-kemerovo
pkgver=96
pkgrel=2
pkgdesc="Map of Kemerovo for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://kemerovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Kemerovo-96.orig.zip")
md5sums=('da378fa2326a5057812b315ec0f02470')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Kemerovo.dgdat "${pkgdir}/opt/2gis/kemerovo.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Kemerovo.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Kemerovo.dglf" || return 1
}
