pkgname=2gis-lipetsk
pkgver=32
pkgrel=1
pkgdesc="Map of Lipetsk for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/lipetsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Lipetsk-32.orig.zip")
md5sums=('091114dfb529e28cd1b713d466fecd78')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Lipetsk.dgdat" "${pkgdir}/opt/2gis/2gis-lipetsk.dgdat" || return 1
  
}
