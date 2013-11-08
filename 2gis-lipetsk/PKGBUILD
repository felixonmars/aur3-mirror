pkgname=2gis-lipetsk
pkgver=24
pkgrel=1
pkgdesc="Map of Lipetsk for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://lipetsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Lipetsk-24.orig.zip")
md5sums=('bf49a1d95d0b7d99a63ba1ce964eb00b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Lipetsk.dgdat" "${pkgdir}/opt/2gis/lipetsk.dgdat" || return 1
  
}
