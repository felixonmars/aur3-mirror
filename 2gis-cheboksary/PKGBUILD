pkgname=2gis-cheboksary
pkgver=28
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://cheboksary.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Cheboksary-28.orig.zip")
md5sums=('358dc58955f73f17ca19c576c3c6551e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Cheboksary.dgdat" "${pkgdir}/opt/2gis/cheboksary.dgdat" || return 1
  
}
