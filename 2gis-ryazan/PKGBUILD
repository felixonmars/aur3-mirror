pkgname=2gis-ryazan
pkgver=43
pkgrel=1
pkgdesc="Map of Ryazan for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/ryazan/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Ryazan-43.orig.zip")
md5sums=('b42d761073fc781a0f5b116c412a05b3')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ryazan.dgdat" "${pkgdir}/opt/2gis/2gis-ryazan.dgdat" || return 1
  
}
