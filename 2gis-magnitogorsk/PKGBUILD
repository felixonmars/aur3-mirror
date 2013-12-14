pkgname=2gis-magnitogorsk
pkgver=44
pkgrel=1
pkgdesc="Map of Magnitogorsk for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://magnitogorsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Magnitogorsk-44.orig.zip")
md5sums=('68154d3ed2099f26163fa204257d2f68')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Magnitogorsk.dgdat" "${pkgdir}/opt/2gis/magnitogorsk.dgdat" || return 1
  
}
