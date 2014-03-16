pkgname=2gis-krasnodar
pkgver=50
pkgrel=1
pkgdesc="Map of Krasnodar for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://krasnodar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Krasnodar-50.orig.zip")
md5sums=('65de3077ffd60479ea9a13ff80c8175a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnodar.dgdat" "${pkgdir}/opt/2gis/krasnodar.dgdat" || return 1
  
}
