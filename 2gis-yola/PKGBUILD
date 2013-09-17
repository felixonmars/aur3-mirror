pkgname=2gis-yola
pkgver=17
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://yola.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Yoshkarola-17.orig.zip")
md5sums=('76d1bee2cef250dbf13643b780e397ad')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yoshkarola.dgdat" "${pkgdir}/opt/2gis/yola.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Yoshkarola.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/yola.dglf" || return 1
}
