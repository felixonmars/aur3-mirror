pkgname=2gis-belgorod
pkgver=36
pkgrel=1
pkgdesc="Map of Belgorod for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/belgorod/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Belgorod-36.orig.zip")
md5sums=('2a96a8e17e4df5fcef37ad835d078b0a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Belgorod.dgdat" "${pkgdir}/opt/2gis/2gis-belgorod.dgdat" || return 1
  
}
