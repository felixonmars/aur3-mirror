pkgname=2gis-arkhangelsk
pkgver=33
pkgrel=1
pkgdesc="Map of Arkhangelsk for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://arkhangelsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Arkhangelsk-33.orig.zip")
md5sums=('d5ec54b0fa0e2118f35609959d1130cb')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Arkhangelsk.dgdat" "${pkgdir}/opt/2gis/2gis-arkhangelsk.dgdat" || return 1
  
}
