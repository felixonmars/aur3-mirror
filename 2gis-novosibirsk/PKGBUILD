pkgname=2gis-novosibirsk
pkgver=175
pkgrel=1
pkgdesc="Map of Novosibirsk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://nsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Novosibirsk-175.orig.zip")
md5sums=('3a1466a7ec86dc768fc0e39bcdb2dbe8')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Novosibirsk.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Novosibirsk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Novosibirsk.dglf" || return 1
}
