pkgname=2gis-spb
pkgver=31
pkgrel=1
pkgdesc="Map of Saint-Petersburg for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://spb.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Spb-31.orig.zip")
md5sums=('ea6e8d781f71ddf84cb5daa1cd6d4c44')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Spb.dgdat" "${pkgdir}/opt/2gis/spb.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Spb.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/spb.dglf" || return 1
}
