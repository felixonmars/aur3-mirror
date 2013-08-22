pkgname=2gis-bryansk
pkgver=18
pkgrel=1
pkgdesc="Map of Bryansk for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://bryansk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Bryansk-18.orig.zip")
md5sums=('f2ec07297380776348f876bdf4543390')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bryansk.dgdat" "${pkgdir}/opt/2gis/bryansk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Bryansk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/bryansk.dglf" || return 1
}
