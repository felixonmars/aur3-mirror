pkgname=2gis-khabarovsk
pkgver=40
pkgrel=1
pkgdesc="Map of Khabarovsk for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://khabarovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Khabarovsk-40.orig.zip")
md5sums=('cf486315a17725bf8f40b87f12495f67')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Khabarovsk.dgdat" "${pkgdir}/opt/2gis/khabarovsk.dgdat" || return 1
  
}
