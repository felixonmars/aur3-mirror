pkgname=2gis-odessa
pkgver=86
pkgrel=1
pkgdesc="Map of Odessa for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://odessa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Odessa-86.orig.zip")
md5sums=('0cc4c9dd0b49a45f68de244d1cfa7e70')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Odessa.dgdat" "${pkgdir}/opt/2gis/2gis-odessa.dgdat" || return 1
  
}
