pkgname=2gis-tver
pkgver=40
pkgrel=1
pkgdesc="Map of Tver for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/tver/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Tver-40.orig.zip")
md5sums=('0d4bdc2de05b17a8a559c7c3c1450219')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tver.dgdat" "${pkgdir}/opt/2gis/2gis-tver.dgdat" || return 1
  
}
