pkgname=2gis-moscow
pkgver=24
pkgrel=1
pkgdesc="Map of Moscow for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://msk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Moscow-24.orig.zip")
md5sums=('8f867dbf64b2ac4c353f61c167098d7e')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Moscow.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Moscow.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Moscow.dglf" || return 1
}
