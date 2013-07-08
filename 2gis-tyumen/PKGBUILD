pkgname=2gis-tyumen
pkgver=80
pkgrel=1
pkgdesc="Map of Tyumen for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://tyumen.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Tyumen-80.orig.zip")
md5sums=('129c804842f06bfcf3e6df1e0b2b8e86')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tyumen.dgdat" "${pkgdir}/opt/2gis/tyumen.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Tyumen.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/tyumen.dglf" || return 1
}
