pkgname=2gis-nabchelny
pkgver=46
pkgrel=1
pkgdesc="Map of Naberezhnye Chelny for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://naberezhnye-chelny.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Nabchelny-46.orig.zip")
md5sums=('56a2856aeb1d73e4dfecb2a6dbd233b5')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Nabchelny.dgdat" "${pkgdir}/opt/2gis/2gis-nabchelny.dgdat" || return 1
  
}
