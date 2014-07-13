pkgname=2gis-astrakhan
pkgver=104
pkgrel=1
pkgdesc="Map of Astrakhan for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/astrahan/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Astrakhan-104.orig.zip")
md5sums=('afae314d8ecf4ed78901d8897fe289d7')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Astrakhan.dgdat" "${pkgdir}/opt/2gis/2gis-astrakhan.dgdat" || return 1
  
}
