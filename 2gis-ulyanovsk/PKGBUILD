pkgname=2gis-ulyanovsk
pkgver=17
pkgrel=1
pkgdesc="Map of Ulyanovsk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://ulyanovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Ulyanovsk-17.orig.zip")
md5sums=('55c32ac8ac3e5cd03378c98244750bc7')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Ulyanovsk.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Ulyanovsk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Ulyanovsk.dglf" || return 1
}
