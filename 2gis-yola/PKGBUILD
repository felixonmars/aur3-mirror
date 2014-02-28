pkgname=2gis-yola
pkgver=22
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://yola.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Yoshkarola-22.orig.zip")
md5sums=('b6c0d69f3fbd979f37815369d9b60132')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yoshkarola.dgdat" "${pkgdir}/opt/2gis/yola.dgdat" || return 1
  
}
