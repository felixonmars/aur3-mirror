pkgname=2gis-saratov
pkgver=43
pkgrel=1
pkgdesc="Map of Saratov for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/saratov/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Saratov-43.orig.zip")
md5sums=('ce185b01da5b5a1422c0909dd838bb63')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Saratov.dgdat" "${pkgdir}/opt/2gis/2gis-saratov.dgdat" || return 1
  
}
