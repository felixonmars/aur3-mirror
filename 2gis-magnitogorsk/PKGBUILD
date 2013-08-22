pkgname=2gis-magnitogorsk
pkgver=40
pkgrel=1
pkgdesc="Map of Magnitogorsk for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://magnitogorsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Magnitogorsk-40.orig.zip")
md5sums=('0c4418281eaef1ab39706586e490613e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Magnitogorsk.dgdat" "${pkgdir}/opt/2gis/magnitogorsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Magnitogorsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/magnitogorsk.dglf" || return 1
}
