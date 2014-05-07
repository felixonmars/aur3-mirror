pkgname=2gis-kurgan
pkgver=98
pkgrel=1
pkgdesc="Map of Kurgan for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://kurgan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Kurgan-98.orig.zip")
md5sums=('a49f2c0e5a3363341ae7f449eda82d42')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kurgan.dgdat" "${pkgdir}/opt/2gis/2gis-kurgan.dgdat" || return 1
  
}
