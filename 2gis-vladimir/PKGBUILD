pkgname=2gis-vladimir
pkgver=33
pkgrel=1
pkgdesc="Map of Vladimir for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/vladimir/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Vladimir-33.orig.zip")
md5sums=('66083b71f96e1d7099784d19316f2fed')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladimir.dgdat" "${pkgdir}/opt/2gis/2gis-vladimir.dgdat" || return 1
  
}
