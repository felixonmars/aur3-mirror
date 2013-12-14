pkgname=2gis-arkhangelsk
pkgver=28
pkgrel=1
pkgdesc="Map of Arkhangelsk for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://arkhangelsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Arkhangelsk-28.orig.zip")
md5sums=('a007e45dc05fc22a48b273f65a7ad80d')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Arkhangelsk.dgdat" "${pkgdir}/opt/2gis/arkhangelsk.dgdat" || return 1
  
}
