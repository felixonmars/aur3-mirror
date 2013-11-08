pkgname=2gis-izhevsk
pkgver=32
pkgrel=1
pkgdesc="Map of Izhevsk for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://izhevsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Izhevsk-32.orig.zip")
md5sums=('2d9d60ab6a84f2d7fd88133780edbec5')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Izhevsk.dgdat" "${pkgdir}/opt/2gis/izhevsk.dgdat" || return 1
  
}
