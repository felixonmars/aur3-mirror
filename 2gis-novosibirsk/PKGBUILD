pkgname=2gis-novosibirsk
pkgver=186
pkgrel=1
pkgdesc="Map of Novosibirsk for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://nsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Novosibirsk-186.orig.zip")
md5sums=('7f352fe66a8a2111501a1ccce59e6ab9')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novosibirsk.dgdat" "${pkgdir}/opt/2gis/novosibirsk.dgdat" || return 1
  
}
