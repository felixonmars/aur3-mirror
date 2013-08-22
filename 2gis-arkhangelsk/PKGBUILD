pkgname=2gis-arkhangelsk
pkgver=24
pkgrel=1
pkgdesc="Map of Arkhangelsk for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://arkhangelsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Arkhangelsk-24.orig.zip")
md5sums=('462d55b731b0d8c15abc3b83ccd678ef')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Arkhangelsk.dgdat" "${pkgdir}/opt/2gis/arkhangelsk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Arkhangelsk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/arkhangelsk.dglf" || return 1
}
