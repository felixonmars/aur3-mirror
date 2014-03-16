pkgname=2gis-yola
pkgver=23
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://yola.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Yoshkarola-23.orig.zip")
md5sums=('c8f3aba40b8fc8c67c135574a209af9f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yoshkarola.dgdat" "${pkgdir}/opt/2gis/yola.dgdat" || return 1
  
}
