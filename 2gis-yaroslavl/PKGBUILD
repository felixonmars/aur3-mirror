pkgname=2gis-yaroslavl
pkgver=45
pkgrel=1
pkgdesc="Map of Yaroslavl for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://yaroslavl.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Yaroslavl-45.orig.zip")
md5sums=('2a495c9a0124c59ae17e9777f42d5554')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yaroslavl.dgdat" "${pkgdir}/opt/2gis/yaroslavl.dgdat" || return 1
  
}
