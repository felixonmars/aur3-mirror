pkgname=2gis-biysk
pkgver=54
pkgrel=1
pkgdesc="Map of Biysk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://biysk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Biysk-54.orig.zip")
md5sums=('ea54841c18c558a8cf0e78e5cd3a4cb2')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Biysk.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Biysk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Biysk.dglf" || return 1
}
