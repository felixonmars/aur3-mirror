pkgname=2gis-yola
pkgver=18
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://yola.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Yoshkarola-18.orig.zip")
md5sums=('148afddb7a451cc2ac6b979a8e53ea6a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yoshkarola.dgdat" "${pkgdir}/opt/2gis/yola.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Yoshkarola.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/yola.dglf" || return 1
}
