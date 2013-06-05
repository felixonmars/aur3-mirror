pkgname=2gis-ekaterinburg
pkgver=90
pkgrel=1
pkgdesc="Map of Ekaterinburg for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://ekaterinburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Ekaterinburg-90.orig.zip")
md5sums=('f3b04483347fc3b8290d74543edd0e84')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ekaterinburg.dgdat" "${pkgdir}/opt/2gis/ekaterinburg.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Ekaterinburg.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/ekaterinburg.dglf" || return 1
}
