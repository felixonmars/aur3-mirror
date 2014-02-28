pkgname=2gis-kostroma
pkgver=40
pkgrel=1
pkgdesc="Map of Kostroma for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://kostroma.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kostroma-40.orig.zip")
md5sums=('78c6954bf15818741cd55c48666ae04c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kostroma.dgdat" "${pkgdir}/opt/2gis/kostroma.dgdat" || return 1
  
}
