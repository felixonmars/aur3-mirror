pkgname=2gis-ntagil
pkgver=38
pkgrel=1
pkgdesc="Map of Nizhny Tagil for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/nizhniy-tagil/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Ntagil-38.orig.zip")
md5sums=('9518d7c544ba842ebe04ccf4c9e8faa4')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ntagil.dgdat" "${pkgdir}/opt/2gis/2gis-ntagil.dgdat" || return 1
  
}
