pkgname=2gis-yakutsk
pkgver=30
pkgrel=1
pkgdesc="Map of Yakutsk for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://yakutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Yakutsk-30.orig.zip")
md5sums=('3380fd448c6766500c521abb014d5658')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yakutsk.dgdat" "${pkgdir}/opt/2gis/yakutsk.dgdat" || return 1
  
}
