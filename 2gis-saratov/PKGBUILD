pkgname=2gis-saratov
pkgver=25
pkgrel=2
pkgdesc="Map of Saratov for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://saratov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Saratov-25.orig.zip")
md5sums=('c4160d234d65d4c09d64b28ed18a5a1f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Saratov.dgdat" "${pkgdir}/opt/2gis/saratov.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Saratov.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/saratov.dglf" || return 1
}
