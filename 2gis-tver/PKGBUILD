pkgname=2gis-tver
pkgver=23
pkgrel=1
pkgdesc="Map of Tver for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://tver.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Tver-23.orig.zip")
md5sums=('ee7173e13cca68b2da085465c69b3db6')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tver.dgdat" "${pkgdir}/opt/2gis/tver.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Tver.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/tver.dglf" || return 1
}
