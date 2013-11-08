pkgname=2gis-nizhnevartovsk
pkgver=90
pkgrel=1
pkgdesc="Map of Nizhnevartovsk for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://nizhnevartovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Nizhnevartovsk-90.orig.zip")
md5sums=('d93b6f68052e1f366dbd0f53f93e50f1')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Nizhnevartovsk.dgdat" "${pkgdir}/opt/2gis/nizhnevartovsk.dgdat" || return 1
  
}
