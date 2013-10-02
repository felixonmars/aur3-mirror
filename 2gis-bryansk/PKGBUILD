pkgname=2gis-bryansk
pkgver=20
pkgrel=1
pkgdesc="Map of Bryansk for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://bryansk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Bryansk-20.orig.zip")
md5sums=('3b2a571dc8fab3f46b50327f58647594')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bryansk.dgdat" "${pkgdir}/opt/2gis/bryansk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Bryansk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/bryansk.dglf" || return 1
}
