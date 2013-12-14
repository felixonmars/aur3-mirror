pkgname=2gis-syktyvkar
pkgver=21
pkgrel=1
pkgdesc="Map of Syktyvkar for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://syktyvkar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Syktyvkar-21.orig.zip")
md5sums=('b6d95ec4b363411a46421e996003b7e0')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Syktyvkar.dgdat" "${pkgdir}/opt/2gis/syktyvkar.dgdat" || return 1
  
}
