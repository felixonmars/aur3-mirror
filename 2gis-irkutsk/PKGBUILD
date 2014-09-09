pkgname=2gis-irkutsk
pkgver=101
pkgrel=1
pkgdesc="Map of Irkutsk for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/irkutsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Irkutsk-101.orig.zip")
md5sums=('05ac98ae10b03f9f1289e62dfc46197f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Irkutsk.dgdat" "${pkgdir}/opt/2gis/2gis-irkutsk.dgdat" || return 1
  
}
