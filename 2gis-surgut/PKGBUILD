pkgname=2gis-surgut
pkgver=32
pkgrel=1
pkgdesc="Map of Surgut for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://surgut.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Surgut-32.orig.zip")
md5sums=('7689738fe002db3319ee4a1c024860c0')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Surgut.dgdat" "${pkgdir}/opt/2gis/surgut.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Surgut.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/surgut.dglf" || return 1
}
