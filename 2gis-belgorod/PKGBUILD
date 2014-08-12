pkgname=2gis-belgorod
pkgver=38
pkgrel=1
pkgdesc="Map of Belgorod for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/belgorod/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Belgorod-38.orig.zip")
md5sums=('4a27509f591bfa5756ae8497e25dc8e9')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Belgorod.dgdat" "${pkgdir}/opt/2gis/2gis-belgorod.dgdat" || return 1
  
}
