pkgname=2gis-tyumen
pkgver=78
pkgrel=2
pkgdesc="Map of Tyumen for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://tyumen.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Tyumen-78.orig.zip")
md5sums=('a309a727fb7c40df6bea75d665ade51e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tyumen.dgdat" "${pkgdir}/opt/2gis/tyumen.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Tyumen.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/tyumen.dglf" || return 1
}
