pkgname=2gis-belgorod
pkgver=37
pkgrel=1
pkgdesc="Map of Belgorod for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/belgorod/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Belgorod-37.orig.zip")
md5sums=('1ea0888eb3bf5a91d7c3a59411253907')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Belgorod.dgdat" "${pkgdir}/opt/2gis/2gis-belgorod.dgdat" || return 1
  
}
