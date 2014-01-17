pkgname=2gis-omsk
pkgver=113
pkgrel=1
pkgdesc="Map of Omsk for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://omsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Omsk-113.orig.zip")
md5sums=('6d3922022a49c5683c592f13b0c9c6cf')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Omsk.dgdat" "${pkgdir}/opt/2gis/omsk.dgdat" || return 1
  
}
