pkgname=2gis-tver
pkgver=28
pkgrel=1
pkgdesc="Map of Tver for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://tver.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Tver-28.orig.zip")
md5sums=('55efe5803e05b1919b1e5a5969ab790e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tver.dgdat" "${pkgdir}/opt/2gis/tver.dgdat" || return 1
  
}
