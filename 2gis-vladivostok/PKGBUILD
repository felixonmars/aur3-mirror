pkgname=2gis-vladivostok
pkgver=44
pkgrel=1
pkgdesc="Map of Vladivostok for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://vladivostok.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Vladivostok-44.orig.zip")
md5sums=('d9a5954a60a8b0cc73afa51d9de14df6')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladivostok.dgdat" "${pkgdir}/opt/2gis/vladivostok.dgdat" || return 1
  
}
