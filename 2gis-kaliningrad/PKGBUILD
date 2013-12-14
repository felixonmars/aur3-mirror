pkgname=2gis-kaliningrad
pkgver=34
pkgrel=1
pkgdesc="Map of Kaliningrad for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://kaliningrad.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kaliningrad-34.orig.zip")
md5sums=('561c09384d654f2f6e4ced80dde5bcce')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kaliningrad.dgdat" "${pkgdir}/opt/2gis/kaliningrad.dgdat" || return 1
  
}
