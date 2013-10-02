pkgname=2gis-samara
pkgver=63
pkgrel=1
pkgdesc="Map of Samara for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://samara.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Samara-63.orig.zip")
md5sums=('cf4d8790580432ca8b04f94667f32664')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Samara.dgdat" "${pkgdir}/opt/2gis/samara.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Samara.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/samara.dglf" || return 1
}
