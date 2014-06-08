pkgname=2gis-ntagil
pkgver=36
pkgrel=1
pkgdesc="Map of Nizhny Tagil for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/nizhniy-tagil/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Ntagil-36.orig.zip")
md5sums=('564d49aa4e98e72a6f233cab5c6ba8a1')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ntagil.dgdat" "${pkgdir}/opt/2gis/2gis-ntagil.dgdat" || return 1
  
}
