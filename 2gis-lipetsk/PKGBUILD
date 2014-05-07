pkgname=2gis-lipetsk
pkgver=30
pkgrel=1
pkgdesc="Map of Lipetsk for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://lipetsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Lipetsk-30.orig.zip")
md5sums=('719b23da728417b8505720d27387e064')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Lipetsk.dgdat" "${pkgdir}/opt/2gis/2gis-lipetsk.dgdat" || return 1
  
}
