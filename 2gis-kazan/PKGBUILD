pkgname=2gis-kazan
pkgver=69
pkgrel=1
pkgdesc="Map of Kazan for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kazan/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Kazan-69.orig.zip")
md5sums=('588be2b1670b34e036874db9fc731af8')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kazan.dgdat" "${pkgdir}/opt/2gis/2gis-kazan.dgdat" || return 1
  
}
