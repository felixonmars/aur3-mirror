pkgname=2gis-izhevsk
pkgver=29
pkgrel=1
pkgdesc="Map of Izhevsk for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://izhevsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Izhevsk-29.orig.zip")
md5sums=('1ef9a3bfcf3f5baa6874345d8388b1df')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Izhevsk.dgdat" "${pkgdir}/opt/2gis/izhevsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Izhevsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/izhevsk.dglf" || return 1
}
