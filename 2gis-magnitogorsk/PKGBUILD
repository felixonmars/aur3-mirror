pkgname=2gis-magnitogorsk
pkgver=45
pkgrel=1
pkgdesc="Map of Magnitogorsk for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://magnitogorsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Magnitogorsk-45.orig.zip")
md5sums=('621ac21a4c9d10a44537380bfcf6a9d9')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Magnitogorsk.dgdat" "${pkgdir}/opt/2gis/magnitogorsk.dgdat" || return 1
  
}
