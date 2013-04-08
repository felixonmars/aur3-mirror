pkgname=2gis-ufa
pkgver=61
pkgrel=1
pkgdesc="Map of Ufa for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://ufa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Ufa-61.orig.zip")
md5sums=('48e8498564e821fbdd415d814c66f38f')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Ufa.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Ufa.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Ufa.dglf" || return 1
}
