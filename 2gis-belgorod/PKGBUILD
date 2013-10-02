pkgname=2gis-belgorod
pkgver=28
pkgrel=1
pkgdesc="Map of Belgorod for 2GIS, October 2013"
arch=('i686' 'x86_64')
url="http://belgorod.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.9.0')
source=("http://download.2gis.ru/arhives/2GISData_Belgorod-28.orig.zip")
md5sums=('44fdb69b808f33fe6d6f5ae81be5ae0d')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Belgorod.dgdat" "${pkgdir}/opt/2gis/belgorod.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Belgorod.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/belgorod.dglf" || return 1
}
