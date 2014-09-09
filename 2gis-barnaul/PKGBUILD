pkgname=2gis-barnaul
pkgver=115
pkgrel=1
pkgdesc="Map of Barnaul for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/barnaul/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Barnaul-115.orig.zip")
md5sums=('f722e5a406dad6f6411f8a4a127bce67')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Barnaul.dgdat" "${pkgdir}/opt/2gis/2gis-barnaul.dgdat" || return 1
  
}
