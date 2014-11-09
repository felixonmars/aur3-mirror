pkgname=2gis-sochi
pkgver=52
pkgrel=1
pkgdesc="Map of Sochi for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/sochi/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Sochi-52.orig.zip")
md5sums=('243dfc3b3185f3a87e2d94a9b688e553')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Sochi.dgdat" "${pkgdir}/opt/2gis/2gis-sochi.dgdat" || return 1
  
}
