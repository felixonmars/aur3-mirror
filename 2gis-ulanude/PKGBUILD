pkgname=2gis-ulanude
pkgver=38
pkgrel=1
pkgdesc="Map of Ulan-Ude for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://ulanude.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Ulanude-38.orig.zip")
md5sums=('9e8b65c6ea026e87bbf21eacbdb742b5')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ulanude.dgdat" "${pkgdir}/opt/2gis/ulanude.dgdat" || return 1
  
}
