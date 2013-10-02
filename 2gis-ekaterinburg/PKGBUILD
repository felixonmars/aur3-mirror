pkgname=2gis-ekaterinburg
pkgver=94
pkgrel=1
pkgdesc="Map of Ekaterinburg for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://ekaterinburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Ekaterinburg-94.orig.zip")
md5sums=('a3a177d6ba7f0f819375c068e6af0126')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ekaterinburg.dgdat" "${pkgdir}/opt/2gis/ekaterinburg.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Ekaterinburg.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/ekaterinburg.dglf" || return 1
}
