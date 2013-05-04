pkgname=2gis-nabchelny
pkgver=35
pkgrel=2
pkgdesc="Map of Naberezhnye Chelny for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://nchelny.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Nabchelny-35.orig.zip")
md5sums=('1db086232fda4775463bfa15accfdd80')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Nabchelny.dgdat" "${pkgdir}/opt/2gis/nabchelny.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Nabchelny.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/nabchelny.dglf" || return 1
}
