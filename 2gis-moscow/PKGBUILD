pkgname=2gis-moscow
pkgver=40
pkgrel=1
pkgdesc="Map of Moscow for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/moscow/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Moscow-40.orig.zip")
md5sums=('b3261cf1a02fd3fd73a31d7f58a1f9d0')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Moscow.dgdat" "${pkgdir}/opt/2gis/2gis-moscow.dgdat" || return 1
  
}
