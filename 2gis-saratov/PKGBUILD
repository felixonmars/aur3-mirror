pkgname=2gis-saratov
pkgver=31
pkgrel=1
pkgdesc="Map of Saratov for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://saratov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Saratov-31.orig.zip")
md5sums=('7d3965c7b90cc1f67b1d136cbe95dfc1')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Saratov.dgdat" "${pkgdir}/opt/2gis/saratov.dgdat" || return 1
  
}
