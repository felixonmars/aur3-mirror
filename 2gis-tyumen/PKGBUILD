pkgname=2gis-tyumen
pkgver=77
pkgrel=1
pkgdesc="Map of Tyumen for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://tyumen.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Tyumen-77.orig.zip")
md5sums=('644869be3ab4042bc9d622e43aa5fb1a')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Tyumen.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Tyumen.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Tyumen.dglf" || return 1
}
