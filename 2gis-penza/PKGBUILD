pkgname=2gis-penza
pkgver=38
pkgrel=1
pkgdesc="Map of Penza for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/penza/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Penza-38.orig.zip")
md5sums=('da68f274116b2b1ad23aa42e3d2f5bb6')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Penza.dgdat" "${pkgdir}/opt/2gis/2gis-penza.dgdat" || return 1
  
}
