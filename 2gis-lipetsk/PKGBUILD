pkgname=2gis-lipetsk
pkgver=36
pkgrel=1
pkgdesc="Map of Lipetsk for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/lipetsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Lipetsk-36.orig.zip")
md5sums=('d6e0c6d758fe7130cbc9e21eee388886')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Lipetsk.dgdat" "${pkgdir}/opt/2gis/2gis-lipetsk.dgdat" || return 1
  
}
