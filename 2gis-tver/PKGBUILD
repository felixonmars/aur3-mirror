pkgname=2gis-tver
pkgver=36
pkgrel=1
pkgdesc="Map of Tver for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/tver/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Tver-36.orig.zip")
md5sums=('670fb7b1a3e1d90374ca3a8b50b6574c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tver.dgdat" "${pkgdir}/opt/2gis/2gis-tver.dgdat" || return 1
  
}
