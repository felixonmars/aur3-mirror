pkgname=2gis-togliatti
pkgver=68
pkgrel=1
pkgdesc="Map of Togliatti for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://tlt.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Togliatti-68.orig.zip")
md5sums=('204af51b775fb2f8458bccd4590157ee')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Togliatti.dgdat" "${pkgdir}/opt/2gis/togliatti.dgdat" || return 1
  
}
