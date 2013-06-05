pkgname=2gis-smolensk
pkgver=12
pkgrel=1
pkgdesc="Map of Smolensk for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://smolensk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Smolensk-12.orig.zip")
md5sums=('9e3dec296c08044ba92b15651d1ea8d8')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Smolensk.dgdat" "${pkgdir}/opt/2gis/smolensk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Smolensk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/smolensk.dglf" || return 1
}
