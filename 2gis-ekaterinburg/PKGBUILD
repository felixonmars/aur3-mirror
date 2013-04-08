pkgname=2gis-ekaterinburg
pkgver=88
pkgrel=2
pkgdesc="Map of Ekaterinburg for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://ekaterinburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Ekaterinburg-88.orig.zip")
md5sums=('30aa8b2ab2ade519b3b8345752cc7d22')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Ekaterinburg.dgdat "${pkgdir}/opt/2gis/ekaterinburg.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Ekaterinburg.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Ekaterinburg.dglf" || return 1
}
