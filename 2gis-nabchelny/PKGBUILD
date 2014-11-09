pkgname=2gis-nabchelny
pkgver=53
pkgrel=1
pkgdesc="Map of Naberezhnye Chelny for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/naberezhnye-chelny/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Nabchelny-53.orig.zip")
md5sums=('11fcc7e3f771197608e85c039c596046')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Nabchelny.dgdat" "${pkgdir}/opt/2gis/2gis-nabchelny.dgdat" || return 1
  
}
