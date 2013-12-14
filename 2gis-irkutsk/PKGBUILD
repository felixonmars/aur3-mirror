pkgname=2gis-irkutsk
pkgver=92
pkgrel=1
pkgdesc="Map of Irkutsk for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://irkutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Irkutsk-92.orig.zip")
md5sums=('045a5e75ef021de318fd110887753053')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Irkutsk.dgdat" "${pkgdir}/opt/2gis/irkutsk.dgdat" || return 1
  
}
