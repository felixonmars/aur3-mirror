pkgname=2gis-smolensk
pkgver=17
pkgrel=1
pkgdesc="Map of Smolensk for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://smolensk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Smolensk-17.orig.zip")
md5sums=('d1fce6edf0bee47d8cd2dee6cea95a54')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Smolensk.dgdat" "${pkgdir}/opt/2gis/smolensk.dgdat" || return 1
  
}
