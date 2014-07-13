pkgname=2gis-chita
pkgver=27
pkgrel=1
pkgdesc="Map of Chita for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/chita/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Chita-27.orig.zip")
md5sums=('6ade3d5d3a35b5aa4bfd5e4461ab0f55')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chita.dgdat" "${pkgdir}/opt/2gis/2gis-chita.dgdat" || return 1
  
}
