pkgname=2gis-tver
pkgver=32
pkgrel=1
pkgdesc="Map of Tver for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://tver.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Tver-32.orig.zip")
md5sums=('faa54746aa231772766e32b9eedb5a8d')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tver.dgdat" "${pkgdir}/opt/2gis/tver.dgdat" || return 1
  
}
