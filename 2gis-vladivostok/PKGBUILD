pkgname=2gis-vladivostok
pkgver=50
pkgrel=1
pkgdesc="Map of Vladivostok for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://vladivostok.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Vladivostok-50.orig.zip")
md5sums=('4bd115441e0daceebc3cd625352a1ac8')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladivostok.dgdat" "${pkgdir}/opt/2gis/2gis-vladivostok.dgdat" || return 1
  
}
