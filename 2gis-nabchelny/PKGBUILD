pkgname=2gis-nabchelny
pkgver=48
pkgrel=1
pkgdesc="Map of Naberezhnye Chelny for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/naberezhnye-chelny/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Nabchelny-48.orig.zip")
md5sums=('ee227f8cc30ad927c4aa120504cca607')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Nabchelny.dgdat" "${pkgdir}/opt/2gis/2gis-nabchelny.dgdat" || return 1
  
}
