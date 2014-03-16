pkgname=2gis-moscow
pkgver=35
pkgrel=1
pkgdesc="Map of Moscow for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://msk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Moscow-35.orig.zip")
md5sums=('3c86237b7bd621a6e5701a405c4861c9')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Moscow.dgdat" "${pkgdir}/opt/2gis/moscow.dgdat" || return 1
  
}
