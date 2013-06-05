pkgname=2gis-nabchelny
pkgver=36
pkgrel=1
pkgdesc="Map of Naberezhnye Chelny for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://nchelny.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Nabchelny-36.orig.zip")
md5sums=('396fafc3d46ce2427114c9aa3e11a507')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Nabchelny.dgdat" "${pkgdir}/opt/2gis/nabchelny.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Nabchelny.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/nabchelny.dglf" || return 1
}
