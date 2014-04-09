pkgname=2gis-tula
pkgver=41
pkgrel=1
pkgdesc="Map of Tula for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://tula.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Tula-41.orig.zip")
md5sums=('a071ef4cc356fe9974e06be54b99c8c2')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tula.dgdat" "${pkgdir}/opt/2gis/2gis-tula.dgdat" || return 1
  
}
