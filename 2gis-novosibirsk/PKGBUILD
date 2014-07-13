pkgname=2gis-novosibirsk
pkgver=190
pkgrel=1
pkgdesc="Map of Novosibirsk for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/novosibirsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Novosibirsk-190.orig.zip")
md5sums=('1600d0e3f89249e02575a0b0e8baa8b4')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novosibirsk.dgdat" "${pkgdir}/opt/2gis/2gis-novosibirsk.dgdat" || return 1
  
}
