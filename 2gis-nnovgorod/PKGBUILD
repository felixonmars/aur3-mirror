pkgname=2gis-nnovgorod
pkgver=63
pkgrel=1
pkgdesc="Map of Nizhny Novgorod for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://nnovgorod.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_N_Novgorod-63.orig.zip")
md5sums=('a5e3c7bc1064d1e952dec6e4031ad02e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_N_novgorod.dgdat" "${pkgdir}/opt/2gis/nnovgorod.dgdat" || return 1
  
}
