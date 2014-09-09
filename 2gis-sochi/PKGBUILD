pkgname=2gis-sochi
pkgver=50
pkgrel=1
pkgdesc="Map of Sochi for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/sochi/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Sochi-50.orig.zip")
md5sums=('b6e6064fabcdbfe937b965deba002a84')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Sochi.dgdat" "${pkgdir}/opt/2gis/2gis-sochi.dgdat" || return 1
  
}
