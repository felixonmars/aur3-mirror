pkgname=2gis-vladimir
pkgver=24
pkgrel=1
pkgdesc="Map of Vladimir for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://vladimir.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Vladimir-24.orig.zip")
md5sums=('ba3244fc8207e1ab21a0a506fc3ba778')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladimir.dgdat" "${pkgdir}/opt/2gis/vladimir.dgdat" || return 1
  
}
