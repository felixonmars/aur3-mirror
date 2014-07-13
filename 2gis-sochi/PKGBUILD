pkgname=2gis-sochi
pkgver=48
pkgrel=1
pkgdesc="Map of Sochi for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/sochi/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Sochi-48.orig.zip")
md5sums=('93e09ad9a18191ac87f5e9fa65a85770')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Sochi.dgdat" "${pkgdir}/opt/2gis/2gis-sochi.dgdat" || return 1
  
}
