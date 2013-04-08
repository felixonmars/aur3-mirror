pkgname=2gis-chelyabinsk
pkgver=68
pkgrel=2
pkgdesc="Map of Chelyabinsk for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://chelyabinsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Chelyabinsk-68.orig.zip")
md5sums=('c102c8d7922b88b988851f2ed315dfe2')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Chelyabinsk.dgdat "${pkgdir}/opt/2gis/chelyabinsk.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Chelyabinsk.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Chelyabinsk.dglf" || return 1
}
