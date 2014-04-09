pkgname=2gis-sochi
pkgver=45
pkgrel=1
pkgdesc="Map of Sochi for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://sochi.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Sochi-45.orig.zip")
md5sums=('48bf01b3220762602915e39dbcd18990')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Sochi.dgdat" "${pkgdir}/opt/2gis/2gis-sochi.dgdat" || return 1
  
}
