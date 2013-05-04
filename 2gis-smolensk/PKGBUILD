pkgname=2gis-smolensk
pkgver=11
pkgrel=2
pkgdesc="Map of Smolensk for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://smolensk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Smolensk-11.orig.zip")
md5sums=('5d2a46e5060052d5cfc745dad76e0cf1')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Smolensk.dgdat" "${pkgdir}/opt/2gis/smolensk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Smolensk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/smolensk.dglf" || return 1
}
