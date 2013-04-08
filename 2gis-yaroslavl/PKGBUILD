pkgname=2gis-yaroslavl
pkgver=34
pkgrel=1
pkgdesc="Map of Yaroslavl for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://yaroslavl.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Yaroslavl-34.orig.zip")
md5sums=('db8dafc34774690c37f51e3866215224')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Yaroslavl.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Yaroslavl.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Yaroslavl.dglf" || return 1
}
