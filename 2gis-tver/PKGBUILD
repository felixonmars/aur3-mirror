pkgname=2gis-tver
pkgver=30
pkgrel=1
pkgdesc="Map of Tver for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://tver.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Tver-30.orig.zip")
md5sums=('6559c9aaf8fafa8a92b630cc72e3dc8c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tver.dgdat" "${pkgdir}/opt/2gis/tver.dgdat" || return 1
  
}
