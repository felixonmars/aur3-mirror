pkgname=2gis-nnovgorod
pkgver=72
pkgrel=1
pkgdesc="Map of Nizhny Novgorod for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/nizhniy-novgorod/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_N_Novgorod-72.orig.zip")
md5sums=('9b113400947dfa076fdef1a9db01e7d4')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_N_Novgorod.dgdat" "${pkgdir}/opt/2gis/2gis-nnovgorod.dgdat" || return 1
  
}
