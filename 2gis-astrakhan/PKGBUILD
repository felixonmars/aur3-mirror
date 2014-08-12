pkgname=2gis-astrakhan
pkgver=105
pkgrel=1
pkgdesc="Map of Astrakhan for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/astrahan/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Astrakhan-105.orig.zip")
md5sums=('b96e85c7c42d746aa2b410db8e5c606b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Astrakhan.dgdat" "${pkgdir}/opt/2gis/2gis-astrakhan.dgdat" || return 1
  
}
