pkgname=2gis-tomsk
pkgver=117
pkgrel=1
pkgdesc="Map of Tomsk for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/tomsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Tomsk-117.orig.zip")
md5sums=('c1ec89d228842a38f836a828996bebfa')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tomsk.dgdat" "${pkgdir}/opt/2gis/2gis-tomsk.dgdat" || return 1
  
}
