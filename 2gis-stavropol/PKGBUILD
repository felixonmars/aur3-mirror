pkgname=2gis-stavropol
pkgver=21
pkgrel=1
pkgdesc="Map of Stavropol for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://stavropol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Stavropol-21.orig.zip")
md5sums=('e49bbe93989a04dc3f8b2828520d93d7')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Stavropol.dgdat" "${pkgdir}/opt/2gis/stavropol.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Stavropol.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/stavropol.dglf" || return 1
}
