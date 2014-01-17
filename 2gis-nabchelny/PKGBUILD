pkgname=2gis-nabchelny
pkgver=43
pkgrel=1
pkgdesc="Map of Naberezhnye Chelny for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://nchelny.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Nabchelny-43.orig.zip")
md5sums=('b2ad961631486cfe810909054309db35')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Nabchelny.dgdat" "${pkgdir}/opt/2gis/nabchelny.dgdat" || return 1
  
}
