pkgname=2gis-tyumen
pkgver=90
pkgrel=1
pkgdesc="Map of Tyumen for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://tyumen.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Tyumen-90.orig.zip")
md5sums=('5a9b20c801aaec1f72c7ccfa91647d48')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tyumen.dgdat" "${pkgdir}/opt/2gis/2gis-tyumen.dgdat" || return 1
  
}
