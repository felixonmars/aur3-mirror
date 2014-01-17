pkgname=2gis-syktyvkar
pkgver=22
pkgrel=1
pkgdesc="Map of Syktyvkar for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://syktyvkar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Syktyvkar-22.orig.zip")
md5sums=('191cb88ef78184196476a968fb070f56')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Syktyvkar.dgdat" "${pkgdir}/opt/2gis/syktyvkar.dgdat" || return 1
  
}
