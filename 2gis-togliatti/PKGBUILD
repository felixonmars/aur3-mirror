pkgname=2gis-togliatti
pkgver=70
pkgrel=1
pkgdesc="Map of Togliatti for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://togliatti.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Togliatti-70.orig.zip")
md5sums=('cf9db0e2c3c3c515deb382cde2916834')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Togliatti.dgdat" "${pkgdir}/opt/2gis/2gis-togliatti.dgdat" || return 1
  
}
