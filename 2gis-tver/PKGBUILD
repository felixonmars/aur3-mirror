pkgname=2gis-tver
pkgver=34
pkgrel=1
pkgdesc="Map of Tver for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://tver.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Tver-34.orig.zip")
md5sums=('0297f7a3d46ad9580f68b198f5537a41')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tver.dgdat" "${pkgdir}/opt/2gis/2gis-tver.dgdat" || return 1
  
}
