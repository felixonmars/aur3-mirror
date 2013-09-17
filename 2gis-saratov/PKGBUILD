pkgname=2gis-saratov
pkgver=29
pkgrel=1
pkgdesc="Map of Saratov for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://saratov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Saratov-29.orig.zip")
md5sums=('e5470fa689131f63ed4c05aff3040037')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Saratov.dgdat" "${pkgdir}/opt/2gis/saratov.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Saratov.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/saratov.dglf" || return 1
}
