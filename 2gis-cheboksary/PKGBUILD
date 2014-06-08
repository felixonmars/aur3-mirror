pkgname=2gis-cheboksary
pkgver=32
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/cheboksary/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Cheboksary-32.orig.zip")
md5sums=('009377ba5c3833209429b579c53fc204')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Cheboksary.dgdat" "${pkgdir}/opt/2gis/2gis-cheboksary.dgdat" || return 1
  
}
