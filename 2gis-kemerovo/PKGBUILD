pkgname=2gis-kemerovo
pkgver=112
pkgrel=1
pkgdesc="Map of Kemerovo for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kemerovo/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Kemerovo-112.orig.zip")
md5sums=('915475af4369788616fdc4d72dc5ae6b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kemerovo.dgdat" "${pkgdir}/opt/2gis/2gis-kemerovo.dgdat" || return 1
  
}
