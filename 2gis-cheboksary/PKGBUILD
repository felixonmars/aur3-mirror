pkgname=2gis-cheboksary
pkgver=23
pkgrel=1
pkgdesc="Map of Cheboksary for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://cheboksary.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Cheboksary-23.orig.zip")
md5sums=('8a8a22cd849a5cba9bad17ae18ac4966')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Cheboksary.dgdat" "${pkgdir}/opt/2gis/cheboksary.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Cheboksary.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/cheboksary.dglf" || return 1
}
