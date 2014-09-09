pkgname=2gis-nabchelny
pkgver=51
pkgrel=1
pkgdesc="Map of Naberezhnye Chelny for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/naberezhnye-chelny/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Nabchelny-51.orig.zip")
md5sums=('6f2ebefec3152e184f10e10b24a7768d')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Nabchelny.dgdat" "${pkgdir}/opt/2gis/2gis-nabchelny.dgdat" || return 1
  
}
