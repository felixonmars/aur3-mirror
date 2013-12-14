pkgname=2gis-tula
pkgver=37
pkgrel=1
pkgdesc="Map of Tula for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://tula.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Tula-37.orig.zip")
md5sums=('e78e50842798fa5f6edcdb77958051d4')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tula.dgdat" "${pkgdir}/opt/2gis/tula.dgdat" || return 1
  
}
