pkgname=2gis-perm
pkgver=72
pkgrel=1
pkgdesc="Map of Perm for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://perm.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Perm-72.orig.zip")
md5sums=('5e4992e25774fdb3888d90aca5939826')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Perm.dgdat" "${pkgdir}/opt/2gis/perm.dgdat" || return 1
  
}
