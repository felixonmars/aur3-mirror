pkgname=2gis-kostroma
pkgver=31
pkgrel=2
pkgdesc="Map of Kostroma for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://kostroma.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Kostroma-31.orig.zip")
md5sums=('9c41850ac51ab107a00b7972319bbc49')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kostroma.dgdat" "${pkgdir}/opt/2gis/kostroma.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kostroma.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kostroma.dglf" || return 1
}
