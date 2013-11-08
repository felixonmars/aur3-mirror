pkgname=2gis-ufa
pkgver=68
pkgrel=1
pkgdesc="Map of Ufa for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://ufa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Ufa-68.orig.zip")
md5sums=('cc7e754d04c202eece6fcd21762fdae3')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ufa.dgdat" "${pkgdir}/opt/2gis/ufa.dgdat" || return 1
  
}
