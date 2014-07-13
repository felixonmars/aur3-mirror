pkgname=2gis-nabchelny
pkgver=49
pkgrel=1
pkgdesc="Map of Naberezhnye Chelny for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/naberezhnye-chelny/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Nabchelny-49.orig.zip")
md5sums=('c6eded4fcef3502f2ee6247f089511ad')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Nabchelny.dgdat" "${pkgdir}/opt/2gis/2gis-nabchelny.dgdat" || return 1
  
}
