pkgname=2gis-ivanovo
pkgver=28
pkgrel=1
pkgdesc="Map of Ivanovo for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/ivanovo/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Ivanovo-28.orig.zip")
md5sums=('d98f420945e895e6ca795444b2ccd2d3')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ivanovo.dgdat" "${pkgdir}/opt/2gis/2gis-ivanovo.dgdat" || return 1
  
}
