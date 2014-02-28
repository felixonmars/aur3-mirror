pkgname=2gis-kemerovo
pkgver=106
pkgrel=1
pkgdesc="Map of Kemerovo for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://kemerovo.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kemerovo-106.orig.zip")
md5sums=('656f0cd6509fb3a1bfe2ea32a4a7139c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kemerovo.dgdat" "${pkgdir}/opt/2gis/kemerovo.dgdat" || return 1
  
}
