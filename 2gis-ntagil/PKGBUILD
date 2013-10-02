pkgname=2gis-ntagil
pkgver=28
pkgrel=1
pkgdesc="Map of Nizhny Tagil for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://ntagil.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Ntagil-28.orig.zip")
md5sums=('13b4f5fc9534e30a9c97754042936c80')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ntagil.dgdat" "${pkgdir}/opt/2gis/ntagil.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Ntagil.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/ntagil.dglf" || return 1
}
