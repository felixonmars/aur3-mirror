pkgname=2gis-tver
pkgver=31
pkgrel=1
pkgdesc="Map of Tver for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://tver.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Tver-31.orig.zip")
md5sums=('8a7e251133391e97e8d22af4e39503a5')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tver.dgdat" "${pkgdir}/opt/2gis/tver.dgdat" || return 1
  
}
