pkgname=2gis-ntagil
pkgver=32
pkgrel=1
pkgdesc="Map of Nizhny Tagil for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://ntagil.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Ntagil-32.orig.zip")
md5sums=('23bc7a0de3d6762a9a2e6c40024f0c0a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ntagil.dgdat" "${pkgdir}/opt/2gis/ntagil.dgdat" || return 1
  
}
