pkgname=2gis-lipetsk
pkgver=17
pkgrel=2
pkgdesc="Map of Lipetsk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://lipetsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Lipetsk-17.orig.zip")
md5sums=('87f2b943deecaed62a561f8b167626da')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Lipetsk.dgdat "${pkgdir}/opt/2gis/lipetsk.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Lipetsk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Lipetsk.dglf" || return 1
}
