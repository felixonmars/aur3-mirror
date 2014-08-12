pkgname=2gis-magnitogorsk
pkgver=52
pkgrel=1
pkgdesc="Map of Magnitogorsk for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/magnitogorsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Magnitogorsk-52.orig.zip")
md5sums=('08423c67172d078d602eb02cdcad923e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Magnitogorsk.dgdat" "${pkgdir}/opt/2gis/2gis-magnitogorsk.dgdat" || return 1
  
}
