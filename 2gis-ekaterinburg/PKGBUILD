pkgname=2gis-ekaterinburg
pkgver=91
pkgrel=1
pkgdesc="Map of Ekaterinburg for 2GIS, July 2013"
arch=('i686' 'x86_64')
url="http://ekaterinburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Ekaterinburg-91.orig.zip")
md5sums=('99e66b588069ebb4591e9e3965d401f2')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ekaterinburg.dgdat" "${pkgdir}/opt/2gis/ekaterinburg.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Ekaterinburg.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/ekaterinburg.dglf" || return 1
}
