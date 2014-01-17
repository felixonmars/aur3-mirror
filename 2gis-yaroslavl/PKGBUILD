pkgname=2gis-yaroslavl
pkgver=43
pkgrel=1
pkgdesc="Map of Yaroslavl for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://yaroslavl.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Yaroslavl-43.orig.zip")
md5sums=('49cc37305ee82ffb06ace25781f0987c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yaroslavl.dgdat" "${pkgdir}/opt/2gis/yaroslavl.dgdat" || return 1
  
}
