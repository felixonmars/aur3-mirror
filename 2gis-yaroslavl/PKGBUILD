pkgname=2gis-yaroslavl
pkgver=41
pkgrel=1
pkgdesc="Map of Yaroslavl for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://yaroslavl.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Yaroslavl-41.orig.zip")
md5sums=('d6ae7c0ee6ef02afb9471882021ea33a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yaroslavl.dgdat" "${pkgdir}/opt/2gis/yaroslavl.dgdat" || return 1
  
}
