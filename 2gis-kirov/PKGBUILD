pkgname=2gis-kirov
pkgver=29
pkgrel=1
pkgdesc="Map of Kirov for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kirov/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Kirov-29.orig.zip")
md5sums=('26954fdec30d6eb4c6da7afa4fe81bd5')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kirov.dgdat" "${pkgdir}/opt/2gis/2gis-kirov.dgdat" || return 1
  
}
