pkgname=2gis-spb
pkgver=32
pkgrel=1
pkgdesc="Map of Saint-Petersburg for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://spb.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Spb-32.orig.zip")
md5sums=('10cf15259d8d06378de55d6c39ebde31')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Spb.dgdat" "${pkgdir}/opt/2gis/spb.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Spb.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/spb.dglf" || return 1
}
