pkgname=2gis-yola
pkgver=13
pkgrel=2
pkgdesc="Map of Yoshkar-Ola for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://yola.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Yoshkarola-13.orig.zip")
md5sums=('0ae396e8dfab4d2ebabafc08027ce34d')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yoshkarola.dgdat" "${pkgdir}/opt/2gis/yola.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Yoshkarola.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/yola.dglf" || return 1
}
