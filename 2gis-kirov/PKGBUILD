pkgname=2gis-kirov
pkgver=24
pkgrel=1
pkgdesc="Map of Kirov for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://kirov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kirov-24.orig.zip")
md5sums=('f174067122ee64328a40187222c05854')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kirov.dgdat" "${pkgdir}/opt/2gis/kirov.dgdat" || return 1
  
}
