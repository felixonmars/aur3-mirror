pkgname=2gis-novosibirsk
pkgver=183
pkgrel=1
pkgdesc="Map of Novosibirsk for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://nsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Novosibirsk-183.orig.zip")
md5sums=('3c44f61a9f5751af76e15f1093cd5f9c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novosibirsk.dgdat" "${pkgdir}/opt/2gis/novosibirsk.dgdat" || return 1
  
}
