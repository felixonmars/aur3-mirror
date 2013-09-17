pkgname=2gis-omsk
pkgver=109
pkgrel=1
pkgdesc="Map of Omsk for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://omsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Omsk-109.orig.zip")
md5sums=('3b8c7b8b6c0d20a9f4d45459595b6b0a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Omsk.dgdat" "${pkgdir}/opt/2gis/omsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Omsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/omsk.dglf" || return 1
}
