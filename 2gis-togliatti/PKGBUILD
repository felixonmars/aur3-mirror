pkgname=2gis-togliatti
pkgver=64
pkgrel=1
pkgdesc="Map of Togliatti for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://tlt.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Togliatti-64.orig.zip")
md5sums=('f3d06c503f5d42e716efa46efd2538d7')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Togliatti.dgdat" "${pkgdir}/opt/2gis/togliatti.dgdat" || return 1
  
}
