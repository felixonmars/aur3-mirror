pkgname=2gis-cheboksary
pkgver=31
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://cheboksary.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Cheboksary-31.orig.zip")
md5sums=('df74a46eceeb0961117fad61e71091e4')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Cheboksary.dgdat" "${pkgdir}/opt/2gis/2gis-cheboksary.dgdat" || return 1
  
}
