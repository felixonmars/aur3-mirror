pkgname=2gis-arkhangelsk
pkgver=20
pkgrel=2
pkgdesc="Map of Arkhangelsk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://arkhangelsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Arkhangelsk-20.orig.zip")
md5sums=('d72f496a115d9c215c3ac4185e836743')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Arkhangelsk.dgdat "${pkgdir}/opt/2gis/arkhangelsk.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Arkhangelsk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Arkhangelsk.dglf" || return 1
}
