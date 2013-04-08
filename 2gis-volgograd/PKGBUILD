pkgname=2gis-volgograd
pkgver=31
pkgrel=2
pkgdesc="Map of Volgograd for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://volgograd.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Volgograd-31.orig.zip")
md5sums=('2641ee533ef38d992c7b8a427e8b3b5f')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Volgograd.dgdat "${pkgdir}/opt/2gis/volgograd.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Volgograd.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Volgograd.dglf" || return 1
}
