pkgname=2gis-belgorod
pkgver=29
pkgrel=1
pkgdesc="Map of Belgorod for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://belgorod.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Belgorod-29.orig.zip")
md5sums=('3caa159073b64eeb0a1dd8f5f5848cc1')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Belgorod.dgdat" "${pkgdir}/opt/2gis/belgorod.dgdat" || return 1
  
}
