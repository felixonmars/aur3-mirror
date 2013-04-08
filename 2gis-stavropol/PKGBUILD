pkgname=2gis-stavropol
pkgver=16
pkgrel=1
pkgdesc="Map of Stavropol for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://stavropol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Stavropol-16.orig.zip")
md5sums=('b2ce1723a719935b64aefd8d999ffa30')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Stavropol.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Stavropol.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Stavropol.dglf" || return 1
}
