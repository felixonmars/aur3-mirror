pkgname=2gis-kazan
pkgver=68
pkgrel=1
pkgdesc="Map of Kazan for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kazan/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Kazan-68.orig.zip")
md5sums=('1c04b0aa7674a47ed9ad63ff08012682')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kazan.dgdat" "${pkgdir}/opt/2gis/2gis-kazan.dgdat" || return 1
  
}
