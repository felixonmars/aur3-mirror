pkgname=2gis-kazan
pkgver=70
pkgrel=1
pkgdesc="Map of Kazan for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kazan/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Kazan-70.orig.zip")
md5sums=('6a3d0774fe8f5faafb92ece37bdbb8a2')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kazan.dgdat" "${pkgdir}/opt/2gis/2gis-kazan.dgdat" || return 1
  
}
