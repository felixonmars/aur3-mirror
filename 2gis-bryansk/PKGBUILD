pkgname=2gis-bryansk
pkgver=16
pkgrel=1
pkgdesc="Map of Bryansk for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://bryansk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Bryansk-16.orig.zip")
md5sums=('61eca51863b9e14a2427071f236e13e9')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bryansk.dgdat" "${pkgdir}/opt/2gis/bryansk.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Bryansk.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/bryansk.dglf" || return 1
}
