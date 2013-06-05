pkgname=2gis-kurgan
pkgver=87
pkgrel=1
pkgdesc="Map of Kurgan for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://kurgan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Kurgan-87.orig.zip")
md5sums=('56738d7c92a90d501979a5043a9ec016')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kurgan.dgdat" "${pkgdir}/opt/2gis/kurgan.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kurgan.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kurgan.dglf" || return 1
}
