pkgname=2gis-kirov
pkgver=16
pkgrel=2
pkgdesc="Map of Kirov for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://kirov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Kirov-16.orig.zip")
md5sums=('1753a2221558c02c50d5edc065ce8ef7')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kirov.dgdat" "${pkgdir}/opt/2gis/kirov.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Kirov.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/kirov.dglf" || return 1
}
