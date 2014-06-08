pkgname=2gis-volgograd
pkgver=45
pkgrel=1
pkgdesc="Map of Volgograd for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/volgograd/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Volgograd-45.orig.zip")
md5sums=('e1e5d5a9df7f8b599afe0fc5cbc71459')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Volgograd.dgdat" "${pkgdir}/opt/2gis/2gis-volgograd.dgdat" || return 1
  
}
