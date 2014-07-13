pkgname=2gis-magnitogorsk
pkgver=51
pkgrel=1
pkgdesc="Map of Magnitogorsk for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/magnitogorsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Magnitogorsk-51.orig.zip")
md5sums=('d521437b48ebe8d691ad62e94a0fac2f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Magnitogorsk.dgdat" "${pkgdir}/opt/2gis/2gis-magnitogorsk.dgdat" || return 1
  
}
