pkgname=2gis-ntagil
pkgver=22
pkgrel=4
pkgdesc="Map of Nizhny Tagil for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://ntagil.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Ntagil-22.orig.zip")
md5sums=('e556e1920a37ae9bc830c3c125b33342')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ntagil.dgdat" "${pkgdir}/opt/2gis/ntagil.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Ntagil.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/ntagil.dglf" || return 1
}
