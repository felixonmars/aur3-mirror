pkgname=2gis-belgorod
pkgver=25
pkgrel=1
pkgdesc="Map of Belgorod for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://belgorod.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Belgorod-25.orig.zip")
md5sums=('474704f2b902db22bd3c83225be0b6f5')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Belgorod.dgdat" "${pkgdir}/opt/2gis/belgorod.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Belgorod.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/belgorod.dglf" || return 1
}
