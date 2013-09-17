pkgname=2gis-bryansk
pkgver=19
pkgrel=1
pkgdesc="Map of Bryansk for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://bryansk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Bryansk-19.orig.zip")
md5sums=('2b05612864f22e59bae5afad43eaf701')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bryansk.dgdat" "${pkgdir}/opt/2gis/bryansk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Bryansk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/bryansk.dglf" || return 1
}
