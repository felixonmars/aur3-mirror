pkgname=2gis-kostroma
pkgver=45
pkgrel=1
pkgdesc="Map of Kostroma for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kostroma/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Kostroma-45.orig.zip")
md5sums=('5523e36eca00a59445b6d805f23c371e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kostroma.dgdat" "${pkgdir}/opt/2gis/2gis-kostroma.dgdat" || return 1
  
}
