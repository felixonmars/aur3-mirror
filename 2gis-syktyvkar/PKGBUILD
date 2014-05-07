pkgname=2gis-syktyvkar
pkgver=26
pkgrel=1
pkgdesc="Map of Syktyvkar for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://syktyvkar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Syktyvkar-26.orig.zip")
md5sums=('f93a98ab40e61827da70126c8628d280')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Syktyvkar.dgdat" "${pkgdir}/opt/2gis/2gis-syktyvkar.dgdat" || return 1
  
}
