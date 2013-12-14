pkgname=2gis-cheboksary
pkgver=26
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://cheboksary.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Cheboksary-26.orig.zip")
md5sums=('dfaa7c836779a14d5bc12a29c5f7391a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Cheboksary.dgdat" "${pkgdir}/opt/2gis/cheboksary.dgdat" || return 1
  
}
