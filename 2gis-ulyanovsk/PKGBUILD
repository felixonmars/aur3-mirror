pkgname=2gis-ulyanovsk
pkgver=23
pkgrel=1
pkgdesc="Map of Ulyanovsk for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://ulyanovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Ulyanovsk-23.orig.zip")
md5sums=('5b0dd92989a3912bdce4aa2f183b3a3d')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ulyanovsk.dgdat" "${pkgdir}/opt/2gis/ulyanovsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Ulyanovsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/ulyanovsk.dglf" || return 1
}
