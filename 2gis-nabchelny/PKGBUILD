pkgname=2gis-nabchelny
pkgver=41
pkgrel=1
pkgdesc="Map of Naberezhnye Chelny for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://nchelny.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Nabchelny-41.orig.zip")
md5sums=('62a38a0d9652981e002bcea7d4a34155')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Nabchelny.dgdat" "${pkgdir}/opt/2gis/nabchelny.dgdat" || return 1
  
}
