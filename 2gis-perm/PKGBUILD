pkgname=2gis-perm
pkgver=76
pkgrel=1
pkgdesc="Map of Perm for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://perm.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Perm-76.orig.zip")
md5sums=('6eb9d1b9626e89ede455c0ed1efb32c6')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Perm.dgdat" "${pkgdir}/opt/2gis/2gis-perm.dgdat" || return 1
  
}
