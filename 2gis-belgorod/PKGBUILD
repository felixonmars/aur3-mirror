pkgname=2gis-belgorod
pkgver=34
pkgrel=1
pkgdesc="Map of Belgorod for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://belgorod.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Belgorod-34.orig.zip")
md5sums=('2aeb0250885b8e5cba83b6963a2035d6')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Belgorod.dgdat" "${pkgdir}/opt/2gis/2gis-belgorod.dgdat" || return 1
  
}
