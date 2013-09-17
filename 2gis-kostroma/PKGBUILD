pkgname=2gis-kostroma
pkgver=35
pkgrel=1
pkgdesc="Map of Kostroma for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://kostroma.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Kostroma-35.orig.zip")
md5sums=('2b31acb027078c55ede73b380734bd1a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kostroma.dgdat" "${pkgdir}/opt/2gis/kostroma.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kostroma.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kostroma.dglf" || return 1
}
