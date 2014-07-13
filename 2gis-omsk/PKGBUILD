pkgname=2gis-omsk
pkgver=119
pkgrel=1
pkgdesc="Map of Omsk for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/omsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Omsk-119.orig.zip")
md5sums=('7481e3646a8db1c1b54c23380c303e51')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Omsk.dgdat" "${pkgdir}/opt/2gis/2gis-omsk.dgdat" || return 1
  
}
