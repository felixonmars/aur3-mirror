pkgname=2gis-astrakhan
pkgver=101
pkgrel=1
pkgdesc="Map of Astrakhan for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://astrahan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Astrakhan-101.orig.zip")
md5sums=('e14e75f91759514ac2e13ac988225609')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Astrakhan.dgdat" "${pkgdir}/opt/2gis/2gis-astrakhan.dgdat" || return 1
  
}
