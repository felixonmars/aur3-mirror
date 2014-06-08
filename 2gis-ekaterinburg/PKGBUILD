pkgname=2gis-ekaterinburg
pkgver=102
pkgrel=1
pkgdesc="Map of Ekaterinburg for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/ekaterinburg/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Ekaterinburg-102.orig.zip")
md5sums=('705f602bd9650d2b4e188f4be9059d24')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ekaterinburg.dgdat" "${pkgdir}/opt/2gis/2gis-ekaterinburg.dgdat" || return 1
  
}
