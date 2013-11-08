pkgname=2gis-kirov
pkgver=22
pkgrel=1
pkgdesc="Map of Kirov for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://kirov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kirov-22.orig.zip")
md5sums=('af6f20a81fb5dc78c5b15dd5352bb554')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kirov.dgdat" "${pkgdir}/opt/2gis/kirov.dgdat" || return 1
  
}
