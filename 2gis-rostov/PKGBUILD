pkgname=2gis-rostov
pkgver=52
pkgrel=1
pkgdesc="Map of Rostov-na-Donu for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/rostov-na-donu/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Rostov-52.orig.zip")
md5sums=('05e1c036c5f5c6ae72071502a42ae267')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Rostov.dgdat" "${pkgdir}/opt/2gis/2gis-rostov.dgdat" || return 1
  
}
