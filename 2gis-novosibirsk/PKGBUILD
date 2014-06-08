pkgname=2gis-novosibirsk
pkgver=189
pkgrel=1
pkgdesc="Map of Novosibirsk for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/novosibirsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Novosibirsk-189.orig.zip")
md5sums=('a59f727e6dcc5dc4525ee32e9035a4f7')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novosibirsk.dgdat" "${pkgdir}/opt/2gis/2gis-novosibirsk.dgdat" || return 1
  
}
