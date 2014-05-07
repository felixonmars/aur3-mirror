pkgname=2gis-kemerovo
pkgver=109
pkgrel=1
pkgdesc="Map of Kemerovo for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://kemerovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Kemerovo-109.orig.zip")
md5sums=('6178c1e9c44120134f8a3c79de539c07')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kemerovo.dgdat" "${pkgdir}/opt/2gis/2gis-kemerovo.dgdat" || return 1
  
}
