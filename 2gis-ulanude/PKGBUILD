pkgname=2gis-ulanude
pkgver=35
pkgrel=1
pkgdesc="Map of Ulan-Ude for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://ulanude.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Ulanude-35.orig.zip")
md5sums=('3dbbc3e5b5acce45f237b54b98c6cafd')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ulanude.dgdat" "${pkgdir}/opt/2gis/ulanude.dgdat" || return 1
  
}
