pkgname=2gis-ufa
pkgver=62
pkgrel=2
pkgdesc="Map of Ufa for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://ufa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Ufa-62.orig.zip")
md5sums=('5c24b19413a6758f563780ce9bf3d368')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ufa.dgdat" "${pkgdir}/opt/2gis/ufa.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Ufa.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/ufa.dglf" || return 1
}
