pkgname=2gis-togliatti
pkgver=66
pkgrel=1
pkgdesc="Map of Togliatti for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://tlt.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Togliatti-66.orig.zip")
md5sums=('8de3a4bf9d45f50b9f0ffbc789fb2c86')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Togliatti.dgdat" "${pkgdir}/opt/2gis/togliatti.dgdat" || return 1
  
}
