pkgname=2gis-astrakhan
pkgver=97
pkgrel=1
pkgdesc="Map of Astrakhan for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://astrakhan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Astrakhan-97.orig.zip")
md5sums=('7e986907fc0ccee757fdd847c85474a7')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Astrakhan.dgdat" "${pkgdir}/opt/2gis/astrakhan.dgdat" || return 1
  
}
