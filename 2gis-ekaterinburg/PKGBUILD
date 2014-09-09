pkgname=2gis-ekaterinburg
pkgver=105
pkgrel=1
pkgdesc="Map of Ekaterinburg for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/ekaterinburg/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Ekaterinburg-105.orig.zip")
md5sums=('ab7c20adf4d3c1510deed242c201d7eb')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ekaterinburg.dgdat" "${pkgdir}/opt/2gis/2gis-ekaterinburg.dgdat" || return 1
  
}
