pkgname=2gis-khabarovsk
pkgver=36
pkgrel=1
pkgdesc="Map of Khabarovsk for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://khabarovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Khabarovsk-36.orig.zip")
md5sums=('4d8a3e25f178f6861610ad948a17b27b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Khabarovsk.dgdat" "${pkgdir}/opt/2gis/khabarovsk.dgdat" || return 1
  
}
