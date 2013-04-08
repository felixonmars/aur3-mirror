pkgname=2gis-irkutsk
pkgver=84
pkgrel=2
pkgdesc="Map of Irkutsk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://irkutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Irkutsk-84.orig.zip")
md5sums=('99a68bee05c407ff597bb0d9b695885a')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Irkutsk.dgdat "${pkgdir}/opt/2gis/irkutsk.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Irkutsk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Irkutsk.dglf" || return 1
}
