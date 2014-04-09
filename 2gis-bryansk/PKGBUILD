pkgname=2gis-bryansk
pkgver=26
pkgrel=1
pkgdesc="Map of Bryansk for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://bryansk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Bryansk-26.orig.zip")
md5sums=('9ed327a97084803acf7a2a7d898fe621')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bryansk.dgdat" "${pkgdir}/opt/2gis/2gis-bryansk.dgdat" || return 1
  
}
