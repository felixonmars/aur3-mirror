pkgname=2gis-odessa
pkgver=74
pkgrel=2
pkgdesc="Map of Odessa for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://odessa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Odessa-74.orig.zip")
md5sums=('3f196a42a03f6cd24dd0d963b28c4b29')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Odessa.dgdat "${pkgdir}/opt/2gis/odessa.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Odessa.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Odessa.dglf" || return 1
}
