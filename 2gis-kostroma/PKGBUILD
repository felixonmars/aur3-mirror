pkgname=2gis-kostroma
pkgver=43
pkgrel=1
pkgdesc="Map of Kostroma for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://kostroma.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Kostroma-43.orig.zip")
md5sums=('7fbb93f170c128cdeaf83d47950b7977')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kostroma.dgdat" "${pkgdir}/opt/2gis/2gis-kostroma.dgdat" || return 1
  
}
