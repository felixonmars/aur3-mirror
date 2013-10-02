pkgname=2gis-ulanude
pkgver=33
pkgrel=1
pkgdesc="Map of Ulan-Ude for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://ulanude.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Ulanude-33.orig.zip")
md5sums=('c5d204c65abe9b8b47793443db935b61')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ulanude.dgdat" "${pkgdir}/opt/2gis/ulanude.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Ulanude.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/ulanude.dglf" || return 1
}
