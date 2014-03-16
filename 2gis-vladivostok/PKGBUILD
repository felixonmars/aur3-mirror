pkgname=2gis-vladivostok
pkgver=48
pkgrel=1
pkgdesc="Map of Vladivostok for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://vladivostok.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Vladivostok-48.orig.zip")
md5sums=('7698e36026492360ba16cbe52ee83014')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladivostok.dgdat" "${pkgdir}/opt/2gis/vladivostok.dgdat" || return 1
  
}
