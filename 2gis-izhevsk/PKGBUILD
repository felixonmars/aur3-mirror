pkgname=2gis-izhevsk
pkgver=31
pkgrel=1
pkgdesc="Map of Izhevsk for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://izhevsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Izhevsk-31.orig.zip")
md5sums=('43b6b9dc4f1d7db7588db516f1b9d65a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Izhevsk.dgdat" "${pkgdir}/opt/2gis/izhevsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Izhevsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/izhevsk.dglf" || return 1
}
