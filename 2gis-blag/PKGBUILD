pkgname=2gis-blag
pkgver=20
pkgrel=2
pkgdesc="Map of Blagoveschensk for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://blag.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Blagoveshensk-20.orig.zip")
md5sums=('982e8c32f0306fcad29b592f8c1f41e6')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Blagoveshensk.dgdat" "${pkgdir}/opt/2gis/blag.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Blagoveshensk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/blag.dglf" || return 1
}
