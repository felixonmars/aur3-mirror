pkgname=2gis-syktyvkar
pkgver=32
pkgrel=1
pkgdesc="Map of Syktyvkar for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/syktyvkar/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Syktyvkar-32.orig.zip")
md5sums=('d3b2773f76809770b398662d7f48b9b1')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Syktyvkar.dgdat" "${pkgdir}/opt/2gis/2gis-syktyvkar.dgdat" || return 1
  
}
