pkgname=2gis-tula
pkgver=38
pkgrel=1
pkgdesc="Map of Tula for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://tula.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Tula-38.orig.zip")
md5sums=('be160c02a2f919112e93c0acff70231a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tula.dgdat" "${pkgdir}/opt/2gis/tula.dgdat" || return 1
  
}
