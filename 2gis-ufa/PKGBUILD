pkgname=2gis-ufa
pkgver=72
pkgrel=1
pkgdesc="Map of Ufa for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://ufa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Ufa-72.orig.zip")
md5sums=('6e4ddbbad95b7d75ef87779a6fa019fb')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ufa.dgdat" "${pkgdir}/opt/2gis/ufa.dgdat" || return 1
  
}
