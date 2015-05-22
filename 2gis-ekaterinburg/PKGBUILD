pkgname=2gis-ekaterinburg
pkgver=113
pkgrel=1
pkgdesc="Map of Ekaterinburg for 2GIS, May 2015"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/ekaterinburg/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Ekaterinburg-${pkgver}.orig.zip")
md5sums=('SKIP')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ekaterinburg.dgdat" "${pkgdir}/opt/2gis/2gis-ekaterinburg.dgdat" || return 1
  
}
