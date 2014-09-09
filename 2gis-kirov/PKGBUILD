pkgname=2gis-kirov
pkgver=32
pkgrel=1
pkgdesc="Map of Kirov for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kirov/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Kirov-32.orig.zip")
md5sums=('1145e627dcc6f67286822133b5a83d29')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kirov.dgdat" "${pkgdir}/opt/2gis/2gis-kirov.dgdat" || return 1
  
}
