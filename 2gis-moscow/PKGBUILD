pkgname=2gis-moscow
pkgver=33
pkgrel=1
pkgdesc="Map of Moscow for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://msk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Moscow-33.orig.zip")
md5sums=('a78d0e7037148a84e0c11a60bb1ffb3e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Moscow.dgdat" "${pkgdir}/opt/2gis/moscow.dgdat" || return 1
  
}
