pkgname=2gis-kostroma
pkgver=41
pkgrel=1
pkgdesc="Map of Kostroma for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://kostroma.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kostroma-41.orig.zip")
md5sums=('7dded027b0ec5dfe0a1966bbb2c29959')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kostroma.dgdat" "${pkgdir}/opt/2gis/kostroma.dgdat" || return 1
  
}
