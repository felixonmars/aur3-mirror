pkgname=2gis-bryansk
pkgver=27
pkgrel=1
pkgdesc="Map of Bryansk for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://bryansk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Bryansk-27.orig.zip")
md5sums=('dbbaf8dd6c0b7cf5d57bae5651ad16f0')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bryansk.dgdat" "${pkgdir}/opt/2gis/2gis-bryansk.dgdat" || return 1
  
}
