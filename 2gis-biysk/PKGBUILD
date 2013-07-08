pkgname=2gis-biysk
pkgver=57
pkgrel=1
pkgdesc="Map of Biysk for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://biysk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Biysk-57.orig.zip")
md5sums=('50eddffe25668eb4b950705afa0c6773')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Biysk.dgdat" "${pkgdir}/opt/2gis/biysk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Biysk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/biysk.dglf" || return 1
}
