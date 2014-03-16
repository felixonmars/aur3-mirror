pkgname=2gis-astrakhan
pkgver=100
pkgrel=1
pkgdesc="Map of Astrakhan for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://astrakhan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Astrakhan-100.orig.zip")
md5sums=('0a68e8bca2fa045d61208223e4dca181')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Astrakhan.dgdat" "${pkgdir}/opt/2gis/astrakhan.dgdat" || return 1
  
}
