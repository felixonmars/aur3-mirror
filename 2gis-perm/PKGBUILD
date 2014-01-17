pkgname=2gis-perm
pkgver=73
pkgrel=1
pkgdesc="Map of Perm for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://perm.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Perm-73.orig.zip")
md5sums=('99ffa6f17acff406730d246137122f78')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Perm.dgdat" "${pkgdir}/opt/2gis/perm.dgdat" || return 1
  
}
