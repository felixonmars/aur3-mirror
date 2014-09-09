pkgname=2gis-biysk
pkgver=71
pkgrel=1
pkgdesc="Map of Biysk for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/biysk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Biysk-71.orig.zip")
md5sums=('71d1e830daf4cf237789033de5327dd0')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Biysk.dgdat" "${pkgdir}/opt/2gis/2gis-biysk.dgdat" || return 1
  
}
