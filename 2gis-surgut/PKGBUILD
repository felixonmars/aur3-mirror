pkgname=2gis-surgut
pkgver=42
pkgrel=1
pkgdesc="Map of Surgut for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/surgut/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Surgut-42.orig.zip")
md5sums=('4f0b7c4c5118157d6aba2ba47824a9ff')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Surgut.dgdat" "${pkgdir}/opt/2gis/2gis-surgut.dgdat" || return 1
  
}
