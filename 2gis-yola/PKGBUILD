pkgname=2gis-yola
pkgver=24
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://joshkar-ola.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Yoshkarola-24.orig.zip")
md5sums=('55bdfdb1e7fe357c21857a4852403f5d')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yoshkarola.dgdat" "${pkgdir}/opt/2gis/2gis-yola.dgdat" || return 1
  
}
