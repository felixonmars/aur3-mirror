pkgname=2gis-ufa
pkgver=76
pkgrel=1
pkgdesc="Map of Ufa for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/ufa/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Ufa-76.orig.zip")
md5sums=('fa43c11907085a34b2d0f71036cbd1df')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ufa.dgdat" "${pkgdir}/opt/2gis/2gis-ufa.dgdat" || return 1
  
}
