pkgname=2gis-saratov
pkgver=32
pkgrel=1
pkgdesc="Map of Saratov for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://saratov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Saratov-32.orig.zip")
md5sums=('213efc671416c4bfa30ac4616ec4bf20')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Saratov.dgdat" "${pkgdir}/opt/2gis/saratov.dgdat" || return 1
  
}
