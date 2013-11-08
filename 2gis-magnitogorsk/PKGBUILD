pkgname=2gis-magnitogorsk
pkgver=43
pkgrel=1
pkgdesc="Map of Magnitogorsk for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://magnitogorsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Magnitogorsk-43.orig.zip")
md5sums=('9003aa153d8c1a956d968d028d29a5ec')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Magnitogorsk.dgdat" "${pkgdir}/opt/2gis/magnitogorsk.dgdat" || return 1
  
}
