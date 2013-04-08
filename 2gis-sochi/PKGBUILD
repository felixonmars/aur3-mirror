pkgname=2gis-sochi
pkgver=33
pkgrel=2
pkgdesc="Map of Sochi for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://sochi.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Sochi-33.orig.zip")
md5sums=('0dd2ebacd0cdfd7f0a6fccdb7b0eabfb')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Sochi.dgdat "${pkgdir}/opt/2gis/sochi.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Sochi.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Sochi.dglf" || return 1
}
