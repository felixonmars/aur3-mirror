pkgname=2gis-syktyvkar
pkgver=23
pkgrel=1
pkgdesc="Map of Syktyvkar for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://syktyvkar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Syktyvkar-23.orig.zip")
md5sums=('89190a596b9ec117d0a544374c7848c6')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Syktyvkar.dgdat" "${pkgdir}/opt/2gis/syktyvkar.dgdat" || return 1
  
}
