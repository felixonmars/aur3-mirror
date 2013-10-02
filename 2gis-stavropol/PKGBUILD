pkgname=2gis-stavropol
pkgver=22
pkgrel=1
pkgdesc="Map of Stavropol for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://stavropol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Stavropol-22.orig.zip")
md5sums=('905d350763dbf0257154e56f952597ec')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Stavropol.dgdat" "${pkgdir}/opt/2gis/stavropol.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Stavropol.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/stavropol.dglf" || return 1
}
