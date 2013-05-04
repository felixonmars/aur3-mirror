pkgname=2gis-belgorod
pkgver=23
pkgrel=2
pkgdesc="Map of Belgorod for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://belgorod.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Belgorod-23.orig.zip")
md5sums=('c679ea1b0e3c70c61f82fb423dcfc704')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Belgorod.dgdat" "${pkgdir}/opt/2gis/belgorod.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Belgorod.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/belgorod.dglf" || return 1
}
