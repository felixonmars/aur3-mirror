pkgname=2gis-magnitogorsk
pkgver=37
pkgrel=2
pkgdesc="Map of Magnitogorsk for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://magnitogorsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Magnitogorsk-37.orig.zip")
md5sums=('b250807210097b6dc466a9ba18fe3560')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Magnitogorsk.dgdat" "${pkgdir}/opt/2gis/magnitogorsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Magnitogorsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/magnitogorsk.dglf" || return 1
}
