pkgname=2gis-magnitogorsk
pkgver=47
pkgrel=1
pkgdesc="Map of Magnitogorsk for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://magnitogorsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Magnitogorsk-47.orig.zip")
md5sums=('0112e8cff2768d84a4739fa800812d8b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Magnitogorsk.dgdat" "${pkgdir}/opt/2gis/magnitogorsk.dgdat" || return 1
  
}
