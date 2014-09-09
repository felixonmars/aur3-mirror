pkgname=2gis-magnitogorsk
pkgver=53
pkgrel=1
pkgdesc="Map of Magnitogorsk for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/magnitogorsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Magnitogorsk-53.orig.zip")
md5sums=('0666ae26e63bb41e39bb219655f8462f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Magnitogorsk.dgdat" "${pkgdir}/opt/2gis/2gis-magnitogorsk.dgdat" || return 1
  
}
