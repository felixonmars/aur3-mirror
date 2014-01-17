pkgname=2gis-izhevsk
pkgver=34
pkgrel=1
pkgdesc="Map of Izhevsk for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://izhevsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Izhevsk-34.orig.zip")
md5sums=('669300c7805a321a0bbe847f1d40989a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Izhevsk.dgdat" "${pkgdir}/opt/2gis/izhevsk.dgdat" || return 1
  
}
