pkgname=2gis-stavropol
pkgver=18
pkgrel=1
pkgdesc="Map of Stavropol for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://stavropol.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Stavropol-18.orig.zip")
md5sums=('4a1fc30393ecc153a09fc6e18c0157dc')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Stavropol.dgdat" "${pkgdir}/opt/2gis/stavropol.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Stavropol.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/stavropol.dglf" || return 1
}
