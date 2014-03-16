pkgname=2gis-ryazan
pkgver=35
pkgrel=1
pkgdesc="Map of Ryazan for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://ryazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Ryazan-35.orig.zip")
md5sums=('2326d6f45b720a453a418eec46680110')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ryazan.dgdat" "${pkgdir}/opt/2gis/ryazan.dgdat" || return 1
  
}
