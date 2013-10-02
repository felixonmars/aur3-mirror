pkgname=2gis-kemerovo
pkgver=102
pkgrel=1
pkgdesc="Map of Kemerovo for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://kemerovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Kemerovo-102.orig.zip")
md5sums=('776f359f99fdec5ce32b1f26d0d1d701')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kemerovo.dgdat" "${pkgdir}/opt/2gis/kemerovo.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kemerovo.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kemerovo.dglf" || return 1
}
