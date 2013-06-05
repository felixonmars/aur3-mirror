pkgname=2gis-biysk
pkgver=56
pkgrel=1
pkgdesc="Map of Biysk for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://biysk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Biysk-56.orig.zip")
md5sums=('b8e59bce97020c422ff50e5c70496673')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Biysk.dgdat" "${pkgdir}/opt/2gis/biysk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Biysk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/biysk.dglf" || return 1
}
