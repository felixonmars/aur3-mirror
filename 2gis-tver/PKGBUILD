pkgname=2gis-tver
pkgver=21
pkgrel=1
pkgdesc="Map of Tver for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://tver.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Tver-21.orig.zip")
md5sums=('84b5dcd7fcd8d6f7a8a8cf30bb5cd12d')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Tver.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Tver.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Tver.dglf" || return 1
}
