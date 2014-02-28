pkgname=2gis-perm
pkgver=74
pkgrel=1
pkgdesc="Map of Perm for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://perm.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Perm-74.orig.zip")
md5sums=('11484af0ddecae126a9cb49af56c90d8')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Perm.dgdat" "${pkgdir}/opt/2gis/perm.dgdat" || return 1
  
}
