pkgname=2gis-nabchelny
pkgver=38
pkgrel=1
pkgdesc="Map of Naberezhnye Chelny for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://nchelny.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Nabchelny-38.orig.zip")
md5sums=('e5ff9839463966aea9d03bf3de131548')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Nabchelny.dgdat" "${pkgdir}/opt/2gis/nabchelny.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Nabchelny.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/nabchelny.dglf" || return 1
}
