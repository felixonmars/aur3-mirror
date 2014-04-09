pkgname=2gis-tver
pkgver=33
pkgrel=1
pkgdesc="Map of Tver for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://tver.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Tver-33.orig.zip")
md5sums=('0fa44f8e7a9f249d676cbb154af575c6')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tver.dgdat" "${pkgdir}/opt/2gis/2gis-tver.dgdat" || return 1
  
}
