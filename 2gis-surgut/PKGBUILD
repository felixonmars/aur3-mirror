pkgname=2gis-surgut
pkgver=41
pkgrel=1
pkgdesc="Map of Surgut for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/surgut/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Surgut-41.orig.zip")
md5sums=('37b00365e0b3ec62eb177336b554186b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Surgut.dgdat" "${pkgdir}/opt/2gis/2gis-surgut.dgdat" || return 1
  
}
