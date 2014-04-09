pkgname=2gis-smolensk
pkgver=22
pkgrel=1
pkgdesc="Map of Smolensk for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://smolensk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Smolensk-22.orig.zip")
md5sums=('e4bd65d5028cc720b3c7a3dde37bd797')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Smolensk.dgdat" "${pkgdir}/opt/2gis/2gis-smolensk.dgdat" || return 1
  
}
