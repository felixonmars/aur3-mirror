pkgname=2gis-khabarovsk
pkgver=30
pkgrel=2
pkgdesc="Map of Khabarovsk for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://khabarovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Khabarovsk-30.orig.zip")
md5sums=('5c0e4ebb884b94b78bea1802a181c2b9')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Khabarovsk.dgdat" "${pkgdir}/opt/2gis/khabarovsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Khabarovsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/khabarovsk.dglf" || return 1
}
