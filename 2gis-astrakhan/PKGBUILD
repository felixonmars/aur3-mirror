pkgname=2gis-astrakhan
pkgver=98
pkgrel=1
pkgdesc="Map of Astrakhan for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://astrakhan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Astrakhan-98.orig.zip")
md5sums=('245e8551c355402888e368d63aca772f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Astrakhan.dgdat" "${pkgdir}/opt/2gis/astrakhan.dgdat" || return 1
  
}
