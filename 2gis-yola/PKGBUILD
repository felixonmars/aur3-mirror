pkgname=2gis-yola
pkgver=20
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://yola.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Yoshkarola-20.orig.zip")
md5sums=('e85d95c93ee3569a9b75b79165d30e98')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yoshkarola.dgdat" "${pkgdir}/opt/2gis/yola.dgdat" || return 1
  
}
