pkgname=2gis-ekaterinburg
pkgver=92
pkgrel=1
pkgdesc="Map of Ekaterinburg for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://ekaterinburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Ekaterinburg-92.orig.zip")
md5sums=('f8c17cee13b9c4ac16fcdc64f6d58466')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ekaterinburg.dgdat" "${pkgdir}/opt/2gis/ekaterinburg.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Ekaterinburg.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/ekaterinburg.dglf" || return 1
}
