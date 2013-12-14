pkgname=2gis-bryansk
pkgver=22
pkgrel=1
pkgdesc="Map of Bryansk for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://bryansk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Bryansk-22.orig.zip")
md5sums=('88476db7f27c5ba1fb2b26e2097ad971')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bryansk.dgdat" "${pkgdir}/opt/2gis/bryansk.dgdat" || return 1
  
}
