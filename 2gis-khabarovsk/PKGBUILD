pkgname=2gis-khabarovsk
pkgver=38
pkgrel=1
pkgdesc="Map of Khabarovsk for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://khabarovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Khabarovsk-38.orig.zip")
md5sums=('4aacff27aba1fec26a0b3e91998e39b2')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Khabarovsk.dgdat" "${pkgdir}/opt/2gis/khabarovsk.dgdat" || return 1
  
}
