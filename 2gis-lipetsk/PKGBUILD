pkgname=2gis-lipetsk
pkgver=28
pkgrel=1
pkgdesc="Map of Lipetsk for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://lipetsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Lipetsk-28.orig.zip")
md5sums=('ab8266d29f20cac09ac1e4ec5cf25fe3')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Lipetsk.dgdat" "${pkgdir}/opt/2gis/lipetsk.dgdat" || return 1
  
}
