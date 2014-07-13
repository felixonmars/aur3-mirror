pkgname=2gis-ivanovo
pkgver=27
pkgrel=1
pkgdesc="Map of Ivanovo for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/ivanovo/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Ivanovo-27.orig.zip")
md5sums=('592093b3f33b56ccc6e5832f4a548c53')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ivanovo.dgdat" "${pkgdir}/opt/2gis/2gis-ivanovo.dgdat" || return 1
  
}
