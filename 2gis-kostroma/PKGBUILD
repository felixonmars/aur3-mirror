pkgname=2gis-kostroma
pkgver=30
pkgrel=2
pkgdesc="Map of Kostroma for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://kostroma.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Kostroma-30.orig.zip")
md5sums=('3639dd9b924fe2143a4314901352b6b7')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Kostroma.dgdat "${pkgdir}/opt/2gis/kostroma.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Kostroma.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Kostroma.dglf" || return 1
}
