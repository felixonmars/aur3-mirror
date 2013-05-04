pkgname=2gis-tver
pkgver=22
pkgrel=2
pkgdesc="Map of Tver for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://tver.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Tver-22.orig.zip")
md5sums=('ffffa7f78dd6b169d5200e1f9b419950')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tver.dgdat" "${pkgdir}/opt/2gis/tver.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Tver.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/tver.dglf" || return 1
}
