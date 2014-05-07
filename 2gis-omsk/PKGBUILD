pkgname=2gis-omsk
pkgver=117
pkgrel=1
pkgdesc="Map of Omsk for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://omsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Omsk-117.orig.zip")
md5sums=('51af11f9b85b1020e27f75cff87a6f3c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Omsk.dgdat" "${pkgdir}/opt/2gis/2gis-omsk.dgdat" || return 1
  
}
