pkgname=2gis-ekaterinburg
pkgver=89
pkgrel=2
pkgdesc="Map of Ekaterinburg for 2GIS, May 2013"
arch=('i686' 'x86_64')
url="http://ekaterinburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Ekaterinburg-89.orig.zip")
md5sums=('b802c3aee868aa493172c7cc27497bbf')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ekaterinburg.dgdat" "${pkgdir}/opt/2gis/ekaterinburg.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Ekaterinburg.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/ekaterinburg.dglf" || return 1
}
