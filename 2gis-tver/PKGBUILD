pkgname=2gis-tver
pkgver=35
pkgrel=1
pkgdesc="Map of Tver for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/tver/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Tver-35.orig.zip")
md5sums=('d4f86ed73e425bfb880f28052ab825ca')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tver.dgdat" "${pkgdir}/opt/2gis/2gis-tver.dgdat" || return 1
  
}
