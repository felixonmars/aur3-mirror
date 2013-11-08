pkgname=2gis-arkhangelsk
pkgver=27
pkgrel=1
pkgdesc="Map of Arkhangelsk for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://arkhangelsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Arkhangelsk-27.orig.zip")
md5sums=('7f0a83b158555830150fcad413684a02')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Arkhangelsk.dgdat" "${pkgdir}/opt/2gis/arkhangelsk.dgdat" || return 1
  
}
