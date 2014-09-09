pkgname=2gis-yola
pkgver=29
pkgrel=1
pkgdesc="Map of Yoshkar-Ola for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/joshkar-ola/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Yoshkarola-29.orig.zip")
md5sums=('3ca0ac5802b464d93bd935e03f7754c1')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yoshkarola.dgdat" "${pkgdir}/opt/2gis/2gis-yola.dgdat" || return 1
  
}
