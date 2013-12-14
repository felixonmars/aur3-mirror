pkgname=2gis-smolensk
pkgver=18
pkgrel=1
pkgdesc="Map of Smolensk for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://smolensk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Smolensk-18.orig.zip")
md5sums=('bac85bde052d52aac3077780af83e741')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Smolensk.dgdat" "${pkgdir}/opt/2gis/smolensk.dgdat" || return 1
  
}
