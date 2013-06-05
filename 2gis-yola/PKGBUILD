pkgname=2gis-yola
pkgver=14
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://yola.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Yoshkarola-14.orig.zip")
md5sums=('b975e1c41bdb79ddb9228df3295fa7ef')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yoshkarola.dgdat" "${pkgdir}/opt/2gis/yola.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Yoshkarola.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/yola.dglf" || return 1
}
