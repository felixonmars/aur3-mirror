pkgname=2gis-izhevsk
pkgver=25
pkgrel=2
pkgdesc="Map of Izhevsk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://izhevsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Izhevsk-25.orig.zip")
md5sums=('e60dce9f2d00e79c4eca835384d8a4f6')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Izhevsk.dgdat "${pkgdir}/opt/2gis/izhevsk.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Izhevsk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Izhevsk.dglf" || return 1
}
