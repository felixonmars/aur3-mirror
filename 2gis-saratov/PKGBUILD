pkgname=2gis-saratov
pkgver=34
pkgrel=1
pkgdesc="Map of Saratov for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://saratov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Saratov-34.orig.zip")
md5sums=('e5a981a78475e0ca332cb8608a477e2a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Saratov.dgdat" "${pkgdir}/opt/2gis/saratov.dgdat" || return 1
  
}
