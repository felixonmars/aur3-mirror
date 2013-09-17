pkgname=2gis-astrakhan
pkgver=94
pkgrel=1
pkgdesc="Map of Astrakhan for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://astrakhan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Astrakhan-94.orig.zip")
md5sums=('b38fd59c8ee162f30ffa8aa2f5677c1e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Astrakhan.dgdat" "${pkgdir}/opt/2gis/astrakhan.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Astrakhan.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/astrakhan.dglf" || return 1
}
