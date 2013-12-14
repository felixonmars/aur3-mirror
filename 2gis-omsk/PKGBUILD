pkgname=2gis-omsk
pkgver=112
pkgrel=1
pkgdesc="Map of Omsk for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://omsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Omsk-112.orig.zip")
md5sums=('2cb076385fb36f86fc81623d445aa881')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Omsk.dgdat" "${pkgdir}/opt/2gis/omsk.dgdat" || return 1
  
}
