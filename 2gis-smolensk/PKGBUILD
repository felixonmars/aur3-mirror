pkgname=2gis-smolensk
pkgver=20
pkgrel=1
pkgdesc="Map of Smolensk for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://smolensk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Smolensk-20.orig.zip")
md5sums=('6ce2492bd0ee0d4bc83a3ba39c20bf5b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Smolensk.dgdat" "${pkgdir}/opt/2gis/smolensk.dgdat" || return 1
  
}
