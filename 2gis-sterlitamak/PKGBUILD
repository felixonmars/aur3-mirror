pkgname=2gis-sterlitamak
pkgver=19
pkgrel=1
pkgdesc="Map of Sterlitamak for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://sterlitamak.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Sterlitamak-19.orig.zip")
md5sums=('f5f8cf1bd0d3e93bcc43444a5a00b7a6')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Sterlitamak.dgdat" "${pkgdir}/opt/2gis/sterlitamak.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Sterlitamak.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/sterlitamak.dglf" || return 1
}
