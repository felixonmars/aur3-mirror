pkgname=2gis-tyumen
pkgver=79
pkgrel=1
pkgdesc="Map of Tyumen for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://tyumen.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Tyumen-79.orig.zip")
md5sums=('eb1174442476522b0b09a8b12d17df9f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tyumen.dgdat" "${pkgdir}/opt/2gis/tyumen.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Tyumen.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/tyumen.dglf" || return 1
}
