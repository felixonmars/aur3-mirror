pkgname=2gis-ntagil
pkgver=26
pkgrel=1
pkgdesc="Map of Nizhny Tagil for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://ntagil.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Ntagil-26.orig.zip")
md5sums=('074b2ae6aa7df6e97fedee7fddf3f3f7')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ntagil.dgdat" "${pkgdir}/opt/2gis/ntagil.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Ntagil.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/ntagil.dglf" || return 1
}
