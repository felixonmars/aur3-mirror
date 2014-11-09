pkgname=2gis-perm
pkgver=83
pkgrel=1
pkgdesc="Map of Perm for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/perm/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Perm-83.orig.zip")
md5sums=('904e7ff1049f2c1d5b33505ab3434f67')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Perm.dgdat" "${pkgdir}/opt/2gis/2gis-perm.dgdat" || return 1
  
}
