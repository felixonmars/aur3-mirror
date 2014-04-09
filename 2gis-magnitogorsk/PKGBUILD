pkgname=2gis-magnitogorsk
pkgver=48
pkgrel=1
pkgdesc="Map of Magnitogorsk for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://magnitogorsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Magnitogorsk-48.orig.zip")
md5sums=('40e3920ad4c90967c9e3e375a488892b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Magnitogorsk.dgdat" "${pkgdir}/opt/2gis/2gis-magnitogorsk.dgdat" || return 1
  
}
