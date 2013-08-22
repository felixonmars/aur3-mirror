pkgname=2gis-ufa
pkgver=65
pkgrel=1
pkgdesc="Map of Ufa for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://ufa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Ufa-65.orig.zip")
md5sums=('01d84643a1f71ec8a7b69d10af41dd12')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ufa.dgdat" "${pkgdir}/opt/2gis/ufa.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Ufa.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/ufa.dglf" || return 1
}
