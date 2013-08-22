pkgname=2gis-kirov
pkgver=19
pkgrel=1
pkgdesc="Map of Kirov for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://kirov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Kirov-19.orig.zip")
md5sums=('8628075016f3c7b558ac8faa0d2ee2e6')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kirov.dgdat" "${pkgdir}/opt/2gis/kirov.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kirov.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kirov.dglf" || return 1
}
