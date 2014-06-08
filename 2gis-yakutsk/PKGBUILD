pkgname=2gis-yakutsk
pkgver=34
pkgrel=1
pkgdesc="Map of Yakutsk for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/yakutsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Yakutsk-34.orig.zip")
md5sums=('07e3a9f636f06f97200caa0d5c6ece11')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yakutsk.dgdat" "${pkgdir}/opt/2gis/2gis-yakutsk.dgdat" || return 1
  
}
