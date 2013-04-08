pkgname=2gis-yola
pkgver=12
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://yola.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Yoshkarola-12.orig.zip")
md5sums=('977f9f1ea03f9345f569883167588386')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Yoshkar-Ola.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Yoshkar-Ola.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Yoshkar-Ola.dglf" || return 1
}
