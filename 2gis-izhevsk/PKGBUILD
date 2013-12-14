pkgname=2gis-izhevsk
pkgver=33
pkgrel=1
pkgdesc="Map of Izhevsk for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://izhevsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Izhevsk-33.orig.zip")
md5sums=('3971fc7cee6b1a249fe18c989a48674c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Izhevsk.dgdat" "${pkgdir}/opt/2gis/izhevsk.dgdat" || return 1
  
}
