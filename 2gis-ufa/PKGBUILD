pkgname=2gis-ufa
pkgver=80
pkgrel=1
pkgdesc="Map of Ufa for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/ufa/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Ufa-80.orig.zip")
md5sums=('6163453552f5a693604596c4255da2c6')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ufa.dgdat" "${pkgdir}/opt/2gis/2gis-ufa.dgdat" || return 1
  
}
