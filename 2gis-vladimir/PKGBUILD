pkgname=2gis-vladimir
pkgver=31
pkgrel=1
pkgdesc="Map of Vladimir for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/vladimir/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Vladimir-31.orig.zip")
md5sums=('c4186d96be5d4bbe496506ab9b97fd47')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladimir.dgdat" "${pkgdir}/opt/2gis/2gis-vladimir.dgdat" || return 1
  
}
