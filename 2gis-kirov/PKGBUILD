pkgname=2gis-kirov
pkgver=25
pkgrel=1
pkgdesc="Map of Kirov for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://kirov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kirov-25.orig.zip")
md5sums=('807f2d1dd11546de1809762f64c27357')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kirov.dgdat" "${pkgdir}/opt/2gis/kirov.dgdat" || return 1
  
}
