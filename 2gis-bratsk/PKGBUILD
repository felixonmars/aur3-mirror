pkgname=2gis-bratsk
pkgver=19
pkgrel=1
pkgdesc="Map of Bratsk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://bratsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Bratsk-19.orig.zip")
md5sums=('f73af6559b74964253e8118e300eea32')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Bratsk.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Bratsk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Bratsk.dglf" || return 1
}
