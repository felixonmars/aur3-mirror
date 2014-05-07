pkgname=2gis-kazan
pkgver=66
pkgrel=1
pkgdesc="Map of Kazan for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://kazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Kazan-66.orig.zip")
md5sums=('df83f0ff8aab60f08b89b275acf32aa5')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kazan.dgdat" "${pkgdir}/opt/2gis/2gis-kazan.dgdat" || return 1
  
}
