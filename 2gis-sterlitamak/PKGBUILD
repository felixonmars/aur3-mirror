pkgname=2gis-sterlitamak
pkgver=21
pkgrel=1
pkgdesc="Map of Sterlitamak for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://sterlitamak.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Sterlitamak-21.orig.zip")
md5sums=('f0865b3472d3e747881f4e35fe54d71f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Sterlitamak.dgdat" "${pkgdir}/opt/2gis/sterlitamak.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Sterlitamak.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/sterlitamak.dglf" || return 1
}
