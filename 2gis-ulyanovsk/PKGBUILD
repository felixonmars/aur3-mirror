pkgname=2gis-ulyanovsk
pkgver=36
pkgrel=1
pkgdesc="Map of Ulyanovsk for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/ulyanovsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Ulyanovsk-36.orig.zip")
md5sums=('09cac8fd51eb64d750ba34e18710b59f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ulyanovsk.dgdat" "${pkgdir}/opt/2gis/2gis-ulyanovsk.dgdat" || return 1
  
}
