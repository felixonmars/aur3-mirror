pkgname=2gis-kurgan
pkgver=88
pkgrel=1
pkgdesc="Map of Kurgan for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://kurgan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Kurgan-88.orig.zip")
md5sums=('2ea8bc456d9b1f8aeded78c1b9e9a9fc')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kurgan.dgdat" "${pkgdir}/opt/2gis/kurgan.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kurgan.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kurgan.dglf" || return 1
}
