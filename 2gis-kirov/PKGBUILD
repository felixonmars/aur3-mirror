pkgname=2gis-kirov
pkgver=26
pkgrel=1
pkgdesc="Map of Kirov for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://kirov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kirov-26.orig.zip")
md5sums=('24118e78066e4c7fb1e3ba990a335e96')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kirov.dgdat" "${pkgdir}/opt/2gis/kirov.dgdat" || return 1
  
}
