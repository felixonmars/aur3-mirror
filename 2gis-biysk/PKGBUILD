pkgname=2gis-biysk
pkgver=68
pkgrel=1
pkgdesc="Map of Biysk for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/biysk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Biysk-68.orig.zip")
md5sums=('7bb4b5beac33eef9f8500360353b0cc0')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Biysk.dgdat" "${pkgdir}/opt/2gis/2gis-biysk.dgdat" || return 1
  
}
