pkgname=2gis-izhevsk
pkgver=36
pkgrel=1
pkgdesc="Map of Izhevsk for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://izhevsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Izhevsk-36.orig.zip")
md5sums=('6125370503d82f8be285f6c5ba8b4d49')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Izhevsk.dgdat" "${pkgdir}/opt/2gis/izhevsk.dgdat" || return 1
  
}
