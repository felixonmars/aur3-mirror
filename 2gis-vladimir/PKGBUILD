pkgname=2gis-vladimir
pkgver=28
pkgrel=1
pkgdesc="Map of Vladimir for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/vladimir/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Vladimir-28.orig.zip")
md5sums=('48e3613d85b1d1f595a12fc2758e425a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladimir.dgdat" "${pkgdir}/opt/2gis/2gis-vladimir.dgdat" || return 1
  
}
