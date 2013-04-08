pkgname=2gis-bryansk
pkgver=14
pkgrel=1
pkgdesc="Map of Bryansk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://bryansk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Bryansk-14.orig.zip")
md5sums=('874e469f2e0ba731f4178ec8f4484291')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Bryansk.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Bryansk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Bryansk.dglf" || return 1
}
