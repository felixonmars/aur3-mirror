pkgname=2gis-togliatti
pkgver=65
pkgrel=1
pkgdesc="Map of Togliatti for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://tlt.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Togliatti-65.orig.zip")
md5sums=('76b5ac3a19f0a553db9e8e2857970805')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Togliatti.dgdat" "${pkgdir}/opt/2gis/togliatti.dgdat" || return 1
  
}
