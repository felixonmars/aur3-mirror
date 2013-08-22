pkgname=2gis-blag
pkgver=23
pkgrel=1
pkgdesc="Map of Blagoveschensk for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://blag.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Blagoveshensk-23.orig.zip")
md5sums=('5c137967b14b44812d28b2246109dfde')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Blagoveshensk.dgdat" "${pkgdir}/opt/2gis/blag.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Blagoveshensk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/blag.dglf" || return 1
}
