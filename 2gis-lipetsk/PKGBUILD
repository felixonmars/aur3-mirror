pkgname=2gis-lipetsk
pkgver=31
pkgrel=1
pkgdesc="Map of Lipetsk for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/lipetsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Lipetsk-31.orig.zip")
md5sums=('a7aa24c5c52a372a02f13b112f8e6a4f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Lipetsk.dgdat" "${pkgdir}/opt/2gis/2gis-lipetsk.dgdat" || return 1
  
}
