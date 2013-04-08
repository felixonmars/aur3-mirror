pkgname=2gis-khabarovsk
pkgver=29
pkgrel=2
pkgdesc="Map of Khabarovsk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://khabarovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Khabarovsk-29.orig.zip")
md5sums=('e3b88d5fdbd612355d02bfef6bfc5492')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Khabarovsk.dgdat "${pkgdir}/opt/2gis/khabarovsk.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Khabarovsk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Khabarovsk.dglf" || return 1
}
