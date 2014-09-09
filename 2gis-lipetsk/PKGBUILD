pkgname=2gis-lipetsk
pkgver=34
pkgrel=1
pkgdesc="Map of Lipetsk for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/lipetsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Lipetsk-34.orig.zip")
md5sums=('df8ec6523b9f8993056e8bc96140987f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Lipetsk.dgdat" "${pkgdir}/opt/2gis/2gis-lipetsk.dgdat" || return 1
  
}
