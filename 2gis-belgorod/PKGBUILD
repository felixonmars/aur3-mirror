pkgname=2gis-belgorod
pkgver=22
pkgrel=1
pkgdesc="Map of Belgorod for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://belgorod.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Belgorod-22.orig.zip")
md5sums=('f90c201c64ae418bee32159163c05ef8')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Belgorod.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Belgorod.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Belgorod.dglf" || return 1
}
