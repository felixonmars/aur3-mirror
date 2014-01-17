pkgname=2gis-ryazan
pkgver=33
pkgrel=1
pkgdesc="Map of Ryazan for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://ryazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Ryazan-33.orig.zip")
md5sums=('fd963abd99038acb66f2828acd223865')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ryazan.dgdat" "${pkgdir}/opt/2gis/ryazan.dgdat" || return 1
  
}
