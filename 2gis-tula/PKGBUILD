pkgname=2gis-tula
pkgver=40
pkgrel=1
pkgdesc="Map of Tula for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://tula.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Tula-40.orig.zip")
md5sums=('3293194cfacfa6a1666f93a16df18bed')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tula.dgdat" "${pkgdir}/opt/2gis/tula.dgdat" || return 1
  
}
