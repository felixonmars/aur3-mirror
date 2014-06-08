pkgname=2gis-bratsk
pkgver=33
pkgrel=1
pkgdesc="Map of Bratsk for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/bratsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Bratsk-33.orig.zip")
md5sums=('c1407172482a59608e17140dcb5d034d')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bratsk.dgdat" "${pkgdir}/opt/2gis/2gis-bratsk.dgdat" || return 1
  
}
