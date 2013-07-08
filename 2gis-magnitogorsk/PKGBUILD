pkgname=2gis-magnitogorsk
pkgver=39
pkgrel=1
pkgdesc="Map of Magnitogorsk for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://magnitogorsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Magnitogorsk-39.orig.zip")
md5sums=('09c4850e67e62e4b80162dacebd6d32f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Magnitogorsk.dgdat" "${pkgdir}/opt/2gis/magnitogorsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Magnitogorsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/magnitogorsk.dglf" || return 1
}
