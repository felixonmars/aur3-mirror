pkgname=2gis-vladivostok
pkgver=37
pkgrel=2
pkgdesc="Map of Vladivostok for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://vladivostok.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Vladivostok-37.orig.zip")
md5sums=('2d15c0bc5fb29d66d1a8b810dfc577a7')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Vladivostok.dgdat "${pkgdir}/opt/2gis/vladivostok.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Vladivostok.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Vladivostok.dglf" || return 1
}
