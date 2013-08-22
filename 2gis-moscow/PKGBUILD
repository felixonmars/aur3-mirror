pkgname=2gis-moscow
pkgver=28
pkgrel=1
pkgdesc="Map of Moscow for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://msk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Moscow-28.orig.zip")
md5sums=('96ab1c02f035c2dae7576aebf398cf29')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Moscow.dgdat" "${pkgdir}/opt/2gis/moscow.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Moscow.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/moscow.dglf" || return 1
}
