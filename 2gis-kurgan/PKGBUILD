pkgname=2gis-kurgan
pkgver=94
pkgrel=1
pkgdesc="Map of Kurgan for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://kurgan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kurgan-94.orig.zip")
md5sums=('bc7c48cd7084ff17b3d4722bf42d6048')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kurgan.dgdat" "${pkgdir}/opt/2gis/kurgan.dgdat" || return 1
  
}
