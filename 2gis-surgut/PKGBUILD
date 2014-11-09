pkgname=2gis-surgut
pkgver=45
pkgrel=1
pkgdesc="Map of Surgut for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/surgut/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Surgut-45.orig.zip")
md5sums=('084aaf33c9cb23f884b571cb76e32e05')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Surgut.dgdat" "${pkgdir}/opt/2gis/2gis-surgut.dgdat" || return 1
  
}
