pkgname=2gis-sterlitamak
pkgver=17
pkgrel=2
pkgdesc="Map of Sterlitamak for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://sterlitamak.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Sterlitamak-17.orig.zip")
md5sums=('a09c423c00349be691a849e7f31667af')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Sterlitamak.dgdat "${pkgdir}/opt/2gis/sterlitamak.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Sterlitamak.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Sterlitamak.dglf" || return 1
}
