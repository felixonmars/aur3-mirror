pkgname=2gis-saratov
pkgver=37
pkgrel=1
pkgdesc="Map of Saratov for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://saratov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Saratov-37.orig.zip")
md5sums=('fcd41347843d899a2f0583f4960d8d96')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Saratov.dgdat" "${pkgdir}/opt/2gis/2gis-saratov.dgdat" || return 1
  
}
