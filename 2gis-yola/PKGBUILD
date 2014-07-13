pkgname=2gis-yola
pkgver=27
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/joshkar-ola/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Yoshkarola-27.orig.zip")
md5sums=('b25a5f9aba2c9ed5f09bd2f6b625b072')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yoshkarola.dgdat" "${pkgdir}/opt/2gis/2gis-yola.dgdat" || return 1
  
}
