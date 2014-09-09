pkgname=2gis-astrakhan
pkgver=106
pkgrel=1
pkgdesc="Map of Astrakhan for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/astrahan/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Astrakhan-106.orig.zip")
md5sums=('4bb3a45cfa5d7d8370fdb415e74a976a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Astrakhan.dgdat" "${pkgdir}/opt/2gis/2gis-astrakhan.dgdat" || return 1
  
}
