pkgname=2gis-novosibirsk
pkgver=194
pkgrel=1
pkgdesc="Map of Novosibirsk for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/novosibirsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Novosibirsk-194.orig.zip")
md5sums=('2def1b5736e2a65fd557be33cba3e0ae')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novosibirsk.dgdat" "${pkgdir}/opt/2gis/2gis-novosibirsk.dgdat" || return 1
  
}
