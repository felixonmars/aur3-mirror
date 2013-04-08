pkgname=2gis-nabchelny
pkgver=34
pkgrel=2
pkgdesc="Map of Naberezhnye Chelny for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://nchelny.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Nabchelny-34.orig.zip")
md5sums=('432b98148697b3102b34218b5ad0f669')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Naberezhnye Chelny.dgdat "${pkgdir}/opt/2gis/nabchelny.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Naberezhnye Chelny.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Naberezhnye Chelny.dglf" || return 1
}
