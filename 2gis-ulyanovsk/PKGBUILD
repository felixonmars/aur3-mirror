pkgname=2gis-ulyanovsk
pkgver=29
pkgrel=1
pkgdesc="Map of Ulyanovsk for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://ulyanovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Ulyanovsk-29.orig.zip")
md5sums=('92c1eb99e80033cead92312f57ee75cb')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ulyanovsk.dgdat" "${pkgdir}/opt/2gis/2gis-ulyanovsk.dgdat" || return 1
  
}
