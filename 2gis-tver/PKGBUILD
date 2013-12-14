pkgname=2gis-tver
pkgver=29
pkgrel=1
pkgdesc="Map of Tver for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://tver.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Tver-29.orig.zip")
md5sums=('b213de2473f6ea1dd2a14b8fbc560b65')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tver.dgdat" "${pkgdir}/opt/2gis/tver.dgdat" || return 1
  
}
