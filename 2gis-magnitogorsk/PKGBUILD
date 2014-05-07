pkgname=2gis-magnitogorsk
pkgver=49
pkgrel=1
pkgdesc="Map of Magnitogorsk for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://magnitogorsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Magnitogorsk-49.orig.zip")
md5sums=('551a4cc87d8830881e4e97d669d164e0')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Magnitogorsk.dgdat" "${pkgdir}/opt/2gis/2gis-magnitogorsk.dgdat" || return 1
  
}
