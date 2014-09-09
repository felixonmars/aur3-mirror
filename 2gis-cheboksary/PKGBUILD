pkgname=2gis-cheboksary
pkgver=35
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/cheboksary/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Cheboksary-35.orig.zip")
md5sums=('313b18886d4f99e0518607b2c27a0712')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Cheboksary.dgdat" "${pkgdir}/opt/2gis/2gis-cheboksary.dgdat" || return 1
  
}
