pkgname=2gis-ryazan
pkgver=40
pkgrel=1
pkgdesc="Map of Ryazan for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/ryazan/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Ryazan-40.orig.zip")
md5sums=('d0d7427e711545171e8934d3117c57e4')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ryazan.dgdat" "${pkgdir}/opt/2gis/2gis-ryazan.dgdat" || return 1
  
}
