pkgname=2gis-magnitogorsk
pkgver=36
pkgrel=1
pkgdesc="Map of Magnitogorsk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://magnitogorsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Magnitogorsk-36.orig.zip")
md5sums=('83c5f33d4643b5410c133d5e8cb3f628')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Magnitogorsk.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Magnitogorsk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Magnitogorsk.dglf" || return 1
}
