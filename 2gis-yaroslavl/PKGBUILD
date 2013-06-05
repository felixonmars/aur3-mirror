pkgname=2gis-yaroslavl
pkgver=36
pkgrel=1
pkgdesc="Map of Yaroslavl for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://yaroslavl.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Yaroslavl-36.orig.zip")
md5sums=('85d041ceda9e0e4f296f580ed4054e8f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yaroslavl.dgdat" "${pkgdir}/opt/2gis/yaroslavl.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Yaroslavl.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/yaroslavl.dglf" || return 1
}
