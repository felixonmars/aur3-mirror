pkgname=2gis-ufa
pkgver=74
pkgrel=1
pkgdesc="Map of Ufa for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://ufa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Ufa-74.orig.zip")
md5sums=('7f0c41cd40ccb06862c2d21fc04e6919')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ufa.dgdat" "${pkgdir}/opt/2gis/2gis-ufa.dgdat" || return 1
  
}
