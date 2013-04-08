pkgname=2gis-chita
pkgver=12
pkgrel=2
pkgdesc="Map of Chita for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://chita.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Chita-12.orig.zip")
md5sums=('55f6e7aadbe4014a5f08b3ff15c81030')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Chita.dgdat "${pkgdir}/opt/2gis/chita.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Chita.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Chita.dglf" || return 1
}
