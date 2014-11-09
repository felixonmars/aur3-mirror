pkgname=2gis-kemerovo
pkgver=115
pkgrel=1
pkgdesc="Map of Kemerovo for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kemerovo/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Kemerovo-115.orig.zip")
md5sums=('3ba6d5df27a2f78a91d3a0ef021fb264')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kemerovo.dgdat" "${pkgdir}/opt/2gis/2gis-kemerovo.dgdat" || return 1
  
}
